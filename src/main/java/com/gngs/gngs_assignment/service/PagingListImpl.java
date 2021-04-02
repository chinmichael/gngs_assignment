package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.*;
import com.gngs.gngs_assignment.repository.GngsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Vector;

@Service
public class PagingListImpl implements PagingList {

    @Autowired
    GngsDao dao;

    //BP Paging List
    public List<BpInformDetailVO> getBpPagingList(BpPagingVO vo) {
        List<BpInformDetailVO> list = new Vector<BpInformDetailVO>();
        list = dao.getBpPagingList(vo);
        for(int i=0; i < list.size(); i++) {
            if(list.get(i).getCorporate_address1() == null || list.get(i).getCorporate_address1().isEmpty()) {
                continue;
            } else {
                String address = list.get(i).getCorporate_address1();
                int idx = address.indexOf("区");
                address = address.substring(0, idx+1);
                list.get(i).setCorporate_address1(address);
            }
        }
        return list;
    }

    public List<BpInformDetailVO> getBpPagingSearchList(BpPagingVO vo) {
        List<BpInformDetailVO> list = new Vector<BpInformDetailVO>();
        if(vo.getSearch_type1().equals("0")) {
            list = dao.getBpSearchPagingListNoType(vo);
        } else {
            list = dao.getBpSearchPagingList(vo);
        }
        for(int i=0; i < list.size(); i++) {
            if(list.get(i).getCorporate_address1() == null || list.get(i).getCorporate_address1().isEmpty()) {
                continue;
            } else {
                String address = list.get(i).getCorporate_address1();
                int idx = address.indexOf("区");
                address = address.substring(0, idx+1);
                list.get(i).setCorporate_address1(address);
            }
        }
        return list;
    }

    //BP Code Paging List
    public List<BpInformDetailVO> getBpCodePagingList(BpCodePagingVO vo) {
        List<BpInformDetailVO> list= new Vector<BpInformDetailVO>();
        if(vo.getCode_search_type1().equals("0")) {
            list = dao.getBpCodeNoType(vo);
        } else {
            list = dao.getBpCode(vo);
        }
        return list;
    }

    //Account Paging List
    public List<AccountVO> getAccountPagingList(AccountPagingVO vo) {
        List<AccountVO> list = new Vector<AccountVO>();
        list = dao.getAccountPagingList(vo);
        return list;
    }

    public List<AccountVO> getAccountPagingSearchList(AccountPagingVO vo) {
        List<AccountVO> list = new Vector<AccountVO>();
        if(vo.getSearch_account_type() == null) {
            list = dao.getAccountSearchPagingList(vo);
        } else {
            list = dao.getAccountSearchPagingListNoType(vo);
        }
        return list;
    }

    //Agreement Paging List
    public List<AgreementVO> get36PagingList(AgreementPagingVO vo) {
        List<AgreementVO> list = new Vector<AgreementVO>();
        list = dao.get36PagingList(vo);
        return list;
    }

    public List<AgreementVO> get36SearchPagingList(AgreementPagingVO vo) {
        List<AgreementVO> list = new Vector<AgreementVO>();
        list = dao.get36SearchPagingList(vo);
        return list;
    }
}
