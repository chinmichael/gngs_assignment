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

        return list;
    }

    public List<BpInformDetailVO> getBpPagingSearchList(BpPagingVO vo) {
        List<BpInformDetailVO> list = new Vector<BpInformDetailVO>();
        if(vo.getSearch_type1().equals("0")) {
            list = dao.getBpSearchPagingListNoType(vo);
        } else {
            list = dao.getBpSearchPagingList(vo);
        }
        return list;
    }

    //Bp Code Paging List

    //Account Paging List
    public List<AccountVO> getAccountPagingList(AccountPagingVO vo) {
        return null;
    }

    public List<AccountVO> getAccountPagingSearchList(AccountPagingVO vo) {
        return null;
    }

    //Agreement Paging List
    public List<AgreementVO> get36PagingList(AgreementPagingVO vo) {
        return null;
    }

    public List<AgreementVO> get36SearchPagingList(AgreementPagingVO vo) {
        return null;
    }

    //BP Code Paging List
    public List<BpInformDetailVO> getBpCodePagingList(BpCodePagingVO vo) {
        return null;
    }
}
