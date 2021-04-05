package com.gngs.gngs_assignment.controller;

import com.gngs.gngs_assignment.model.*;
import com.gngs.gngs_assignment.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/bp")
public class BPController {

    @Autowired
    PagingList pagingList;
    @Autowired
    Regist regist;
    @Autowired
    Mail mail;
    @Autowired
    Security security;

    @Autowired
    @Qualifier("bpPaging")
    private PagingMap bpPaging;

    @Autowired
    @Qualifier("bpCodePaging")
    private PagingMap bpCodePaging;

    @Autowired
    @Qualifier("accountPaging")
    private PagingMap accountPaging;

    @Autowired
    @Qualifier("agreementPaging")
    private PagingMap agreementPaging;

    //Ajax
    @RequestMapping(value="/bpZipcodeCheck")
    public HashMap<String, String> bpZipcodeCheck (@RequestParam("zipcode") String zipcode) {
        HashMap<String, String> result = new HashMap <String,String>();

        if(zipcode == null || zipcode.isEmpty()) {
            zipcode = "";
        }
        String address = regist.getZipAddress(zipcode);
        result.put("address", address);

        return result;
    }

    @RequestMapping(value="/bpCodeSearch")
    public HashMap<String, Object> bpCodeSearch(Long page, String code_search_name,
                                                String code_search_type1, String code_search_type2) {
        HashMap<String, Object> result = new HashMap<String, Object>();

        if(code_search_name == null || code_search_name.isEmpty()) {
            String errorMsg = "会社名を入力してください。";
            result.put("error", errorMsg);

        } else {
            if(page == null) page = (long) 1;
            long initPage = page;
            BpCodePagingVO vo = new BpCodePagingVO();
            vo.setPage(initPage);
            List<BpInformDetailVO> list = pagingList.getBpCodePagingList(vo);
            HashMap<String, Object> pagingListCnt = bpCodePaging.getSearchCnt(vo);
            HashMap<String, Object> resMap = bpCodePaging.getResMap(vo, pagingListCnt);

            result.put("pagingList", list);
            result.put("resMap", resMap);
            result.put("currentPage", page);

            result.put("code_search_name", code_search_name);
            result.put("code_search_type1", code_search_type1);
            result.put("code_search_type2", code_search_type2);
        }
        return result;
    }

    // BP
    @RequestMapping(value="/bpList")
    public ModelAndView bpList(Long page) {
        ModelAndView mav = new ModelAndView("bp/bpList");

        if(page == null) {
            page = (long) 1;
        }
        long initPage = page;
        BpPagingVO vo = new BpPagingVO();
        vo.setPage(initPage);
        List<BpInformDetailVO> list = pagingList.getBpPagingList(vo);
        HashMap<String, Object> pagingListCnt = bpPaging.getPagingCnt(vo);
        HashMap<String, Object> resMap = bpPaging.getResMap(vo, pagingListCnt);

        mav.addObject("pagingList", list);
        mav.addObject("resMap", resMap);
        mav.addObject("currentPage", page);

        return mav;
    }

    @RequestMapping(value="/bpSearch")
    public ModelAndView bpSearch(Long page, String searchType1, Integer searchType2, String searchName) {
        ModelAndView mav = new ModelAndView("bp/bpList");

        if(page == null) {
            page = (long) 1;
        }
        long initPage = page;

        if(searchName == null || searchName.isEmpty()) {
            searchName = "";
        }
        BpPagingVO vo = new BpPagingVO();
        vo.setSearch_name("%"+searchName+"%");
        vo.setSearch_type1(searchType1);
        vo.setSearch_type2(searchType2);

        vo.setPage(initPage);
        List<BpInformDetailVO> list = pagingList.getBpPagingSearchList(vo);
        HashMap<String, Object> pagingListCnt = bpPaging.getSearchCnt(vo);
        HashMap<String, Object> resMap = bpPaging.getResMap(vo, pagingListCnt);

        mav.addObject("pagingList", list);
        mav.addObject("resMap", resMap);
        mav.addObject("currentPage", page);

        mav.addObject("searchType1", searchType1);
        mav.addObject("searchType2", searchType2);
        mav.addObject("searchName", searchName);

        return mav;
    }

    @RequestMapping(value="/bpRequestForm")
    public ModelAndView bpRequest() {
        ModelAndView mav = new ModelAndView("bp/bpRequestForm");
        mav.addObject(new BpInformVO());
        return mav;
    }

    @RequestMapping(value="/bpRequestSend")
    public ModelAndView bpResquestSend(@Valid @ModelAttribute BpInformVO vo, BindingResult br) {
        ModelAndView mav;

        if(br.hasErrors()) {
            mav = new ModelAndView("bp/bpRequestForm");
            mav.getModel().putAll(br.getModel());
            mav.addObject("bpType", vo.getBp_type());
            mav.addObject("compType", vo.getCorporate_type1());
            return mav;
        }

        mav = new ModelAndView("bp/bpRequestCheck");
        mav.addObject("bpInform", vo);
        mav.addObject(new BpInformVO());

        return mav;
    }

    @RequestMapping(value="/bpRequestCheckSend")
    public ModelAndView bpRequestCheckSend(@ModelAttribute BpInformVO vo, HttpSession session) {

        if(vo.getContract_dept() == null || vo.getContract_dept().isEmpty()) vo.setContract_dept("");
        if(vo.getContract_manager() == null || vo.getContract_manager().isEmpty()) vo.setContract_manager("");

        vo.setUuid(security.createBpUuid());

        String who = "";
        if(vo.getCorporate_type1() == 0) {
            who = vo.getCorporate_name() + "\n" + vo.getContract_manager() + "様";
        } else {
            who = vo.getCorporate_name() + "様";
        }

        Integer check = regist.insertBpRuquest(vo);

        LoginVO loginVO = (LoginVO) session.getAttribute("login");
        BpMailVO mailVO = new BpMailVO();
        mailVO.setTo(vo.getContract_mail());
        mailVO.setSubject("件名：御社基本情報登録のお願い");
        mailVO.setContents(who, loginVO.getUsername(),vo.getUuid());

        mail.sendBpMail(mailVO);

        ModelAndView mav = new ModelAndView("redirect:/bp/bpRequestClear");

        return mav;
    }

    @RequestMapping(value="/bpRequestClear")
    public ModelAndView bpRequestClear() {
        ModelAndView mav = new ModelAndView("bp/bpRequestClear");
        return mav;
    }

    @RequestMapping(value="/bpGoRegistAdmin")
    public ModelAndView bpGoRegistAdmin(@ModelAttribute BpInformVO vo) {

        if(vo.getContract_dept() == null || vo.getContract_dept().isEmpty()) vo.setContract_dept("");
        if(vo.getContract_manager() == null || vo.getContract_manager().isEmpty()) vo.setContract_manager("");

        String key = security.createBpUuid();
        vo.setUuid(key);

        Integer check = regist.insertBpRuquest(vo);

        ModelAndView mav = new ModelAndView("redirect:/bp/bpRegistAdmin?key=" + key);
        return mav;
    }

    @RequestMapping(value="/bpRegistAdmin")
    public ModelAndView bpRegistAdmin(String key) {

        BpInformDetailVO result = regist.getBpInform(key);

        ModelAndView mav = new ModelAndView("bp/bpRegistAdmin");

        mav.addObject(new BpInformDetailVO());
        mav.addObject("bpInform", result);
        return mav;
    }

    @RequestMapping(value="/bpRegistAdminSend")
    public ModelAndView bpRegistAdminSend (@Valid @ModelAttribute BpInformDetailVO vo, BindingResult br) {
        ModelAndView mav;

        if(br.hasErrors()) {
            mav = new ModelAndView("bp/bpRegistAdmin");
            mav.getModel().putAll(br.getModel());

            mav.addObject("bpInform", vo);

            return mav;
        }

        mav = new ModelAndView("bp/bpRegistAdminCheck");
        mav.addObject("bpInform", vo);
        mav.addObject(new BpInformDetailVO());

        return mav;
    }

    @RequestMapping(value="/bpRegistAdminCheckSend")
    public ModelAndView bpRegistAdminCheckSend(@ModelAttribute BpInformDetailVO vo, HttpSession session) {
        ModelAndView mav = new ModelAndView("redirect:/bp/bpRequestClear");

        return mav;
    }

    @RequestMapping(value="/bpModify")
    public ModelAndView bpModify(String key) {
        ModelAndView mav = new ModelAndView("bp/bpModify");
        BpInformDetailVO result = regist.getBpInform(key);

        String checkAccount = regist.getCheckAccount(result.getBp_id());
        String checkAgreement = regist.getCheckAgreement(result.getBp_id());
        if(checkAccount != "") mav.addObject("bpAccount", "exist");
        if(checkAgreement != "") mav.addObject("bpAgreement", checkAgreement);

        mav.addObject(new BpInformDetailVO());
        mav.addObject("bpInform", result);
        return mav;
    }

    @RequestMapping(value="/bpModifySend")
    public ModelAndView bpModifySend (@Valid @ModelAttribute BpInformDetailVO vo, BindingResult br, String moveKey) {
        ModelAndView mav;

        if(br.hasErrors()) {
            mav = new ModelAndView("bp/bpModify");
            mav.getModel().putAll(br.getModel());
            mav.addObject("bpInform", vo);

            return mav;
        }

        mav = new ModelAndView("bp/bpModifyCheck");
        mav.addObject("bpInform", vo);
        mav.addObject(new BpInformDetailVO());

        return mav;
    }

    @RequestMapping(value="/bpModifyCheckSend")
    public ModelAndView bpModifyCheckSend(@ModelAttribute BpInformDetailVO vo, HttpSession session) {
        ModelAndView mav = new ModelAndView("redirect:/bp/bpRequestClear");

        return mav;
    }

    // BP Account

    @RequestMapping(value="/accountList")
    public ModelAndView accountList(Long page) {
        ModelAndView mav = new ModelAndView("bp/accountList");

        if(page == null) {
            page = (long) 1;
        }

        long initPage = page;
        AccountPagingVO vo = new AccountPagingVO();
        vo.setPage(initPage);

        List<AccountVO> list = pagingList.getAccountPagingList(vo);
        HashMap<String, Object> resMap = accountPaging.getResMap(vo, accountPaging.getPagingCnt(vo));

        mav.addObject("pagingList", list);
        mav.addObject("resMap", resMap);
        mav.addObject("currentPage", page);

        return mav;
    }

    @RequestMapping(value="/accountSearch")
    public ModelAndView accountSearch(Long page, String search_bank_name,
                                      String search_branch_name, String search_account_name, Integer search_account_type) {
        ModelAndView mav = new ModelAndView("bp/accountSearch");

        if(page == null) page = (long) 1;
        if(search_bank_name == null || search_bank_name.isEmpty()) search_bank_name = "";
        if(search_branch_name == null || search_branch_name.isEmpty()) search_branch_name = "";
        if(search_account_name == null || search_account_name.isEmpty()) search_account_name = "";

        long initPage = page;
        AccountPagingVO vo = new AccountPagingVO();
        vo.setSearch_bank_name("%"+search_bank_name+"%");
        vo.setSearch_branch_name("%"+search_branch_name+"%");
        vo.setSearch_account_name("%"+search_account_name+"%");
        vo.setSearch_account_type(search_account_type);

        List<AccountVO> list = pagingList.getAccountPagingSearchList(vo);
        HashMap<String, Object> resMap = accountPaging.getResMap(vo, accountPaging.getSearchCnt(vo));

        mav.addObject("pagingList", list);
        mav.addObject("resMap", resMap);
        mav.addObject("currentPage", page);

        mav.addObject("search_bank_name", search_bank_name);
        mav.addObject("search_branch_name", search_branch_name);
        mav.addObject("search_account_name", search_account_name);
        mav.addObject("search_account_type", search_account_type);

        return mav;
    }

    @RequestMapping(value="/accountForm")
    public ModelAndView accountForm() {
        ModelAndView mav = new ModelAndView("bp/accountForm");
        mav.addObject(new AccountVO());
        return mav;
    }

    // BP 36Agreement

    @RequestMapping(value="/agreementList")
    public ModelAndView agreementList(Long page) {
        ModelAndView mav = new ModelAndView("bp/agreementList");

        if(page == null) page = (long) 1;

        long initPage = page;
        AgreementPagingVO vo = new AgreementPagingVO();
        vo.setPage(initPage);

        List<AgreementVO> list = pagingList.get36PagingList(vo);
        HashMap<String, Object> resMap = agreementPaging.getResMap(vo, agreementPaging.getPagingCnt(vo));

        mav.addObject("pagingList", list);
        mav.addObject("resMap", resMap);
        mav.addObject("currentPage", page);

        return mav;
    }

    @RequestMapping(value="/agreementSearch")
    public ModelAndView agreementSearch(Long page, String search_dispatch,
                                        String search_pattern_code, String search_pattern_name) {
        ModelAndView mav = new ModelAndView("bp/agreemtnSerach");

        if(page == null) page = (long) 1;
        if(search_dispatch == null || search_dispatch.isEmpty()) search_dispatch = "";
        if(search_pattern_code == null || search_pattern_code.isEmpty()) search_pattern_code = "";
        if(search_pattern_name == null || search_pattern_name.isEmpty()) search_pattern_name = "";

        long initPage = page;
        AgreementPagingVO vo = new AgreementPagingVO();
        vo.setPage(initPage);

        List<AgreementVO> list = pagingList.get36SearchPagingList(vo);
        HashMap<String, Object> resMap = agreementPaging.getResMap(vo, agreementPaging.getSearchCnt(vo));

        mav.addObject("pagingList", list);
        mav.addObject("resMap", resMap);
        mav.addObject("currentPage", page);

        mav.addObject("search_dispatch", search_dispatch);
        mav.addObject("search_pattern_code", search_pattern_code);
        mav.addObject("search_pattern_name", search_pattern_name);

        return mav;
    }

    @RequestMapping(value="/agreementForm")
    public ModelAndView agreementForm(String bpUuid) {
        ModelAndView mav = new ModelAndView("bp/agreementForm");

        if(bpUuid == null || bpUuid.isEmpty()) {

        } else {
            mav.addObject(new AgreementVO());
        }

        return mav;
    }
}
