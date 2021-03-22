package com.gngs.gngs_assignment.controller;

import com.gngs.gngs_assignment.model.*;
import com.gngs.gngs_assignment.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;

@Controller
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
    private PagingMap paging;

    @RequestMapping(value="/bpList")
    public ModelAndView bpList(Long page) throws Exception {
        ModelAndView mav = new ModelAndView("bp/bpList");

        if(page == null) {
            page = (long) 1;
        }
        long initPage = page;
        BpPagingVO vo = new BpPagingVO();
        vo.setPage(initPage);
        List<BpInformDetailVO> list = pagingList.getBpPagingList(vo);
        HashMap<String, Object> pagingListCnt = paging.getPagingCnt(vo);
        HashMap<String, Object> resMap = paging.getResMap(vo, pagingListCnt);

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

        System.out.println(vo.getSearch_name());
        System.out.println(vo.getSearch_type1());
        System.out.println(vo.getSearch_type2());

        vo.setPage(initPage);
        List<BpInformDetailVO> list = pagingList.getBpPagingSearchList(vo);
        HashMap<String, Object> pagingListCnt = paging.getSearchCnt(vo);
        HashMap<String, Object> resMap = paging.getResMap(vo, pagingListCnt);

        mav.addObject("pagingList", list);
        mav.addObject("resMap", resMap);
        mav.addObject("currentPage", page);

        mav.addObject("searchType1", searchType1);
        mav.addObject("searchType2", searchType2);
        mav.addObject("searchName", searchName);

        return mav;
    }

    @RequestMapping(value="/bpRequestForm")
    public ModelAndView bpRequest() throws Exception {
        ModelAndView mav = new ModelAndView("bp/bpRequestForm");
        mav.addObject(new BpInformVO());
        return mav;
    }

    @RequestMapping(value="/bpRequestSend")
    public ModelAndView bpResquestSend(@Valid @ModelAttribute BpInformVO vo, BindingResult br) throws Exception {
        ModelAndView mav;

        if(br.hasErrors()) {
            mav = new ModelAndView("bp/bpRequestForm");
            mav.getModel().putAll(br.getModel());
            return mav;
        }

        mav = new ModelAndView("bp/bpRequestCheck");
        mav.addObject("bpInform", vo);
        mav.addObject(new BpInformVO());

        return mav;
    }

    @RequestMapping(value="/bpRequestCheckSend")
    public ModelAndView bpRequestCheckSend(@ModelAttribute BpInformVO vo, HttpSession session) throws Exception {

        if(vo.getContract_dept() == null || vo.getContract_dept().isEmpty()) vo.setContract_dept("");
        if(vo.getContract_manager() == null || vo.getContract_manager().isEmpty()) vo.setContract_manager("");

        vo.setUuid(security.createBpUuid());

        String who = "";
        if(vo.getCorporate_type1() == 0) {
            who = vo.getCorporate_name() + "\n" + vo.getContract_manager() + "様";
        } else {
            who = vo.getCorporate_name() + "様";
        }

        Integer check = regist.bpRuquestInsert(vo);

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

    @RequestMapping(value="/bpRegistAdmin")
    public ModelAndView bpRegistAdmin(String key) {
        ModelAndView mav = new ModelAndView("bp/bpRegistAdmin");
        BpInformVO vo = new BpInformVO();
        vo.setUuid(key);
        BpInformDetailVO result = regist.showBpInform(vo);

        mav.addObject(new BpInformDetailVO());
        mav.addObject("bpInform", result);
        return mav;
    }

    @RequestMapping(value="/additionalInform")
    public ModelAndView additionalInform(String key) {
        ModelAndView mav = new ModelAndView("bp/additionalInform");
        mav.addObject("keyId", regist.pullBpId(key));
        mav.addObject(new AdditionalInformVO());
        return mav;
    }
}
