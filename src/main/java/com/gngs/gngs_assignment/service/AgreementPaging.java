package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.AgreementPagingVO;
import com.gngs.gngs_assignment.model.CommonPagingVO;
import com.gngs.gngs_assignment.repository.GngsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class AgreementPaging extends PagingMap {

    @Autowired
    GngsDao dao;

    public HashMap<String, Object> getPagingCnt(CommonPagingVO vo) {
        AgreementPagingVO tc = (AgreementPagingVO) vo;
        HashMap<String, Object> agreementPagingListCnt = new HashMap<String, Object>();

        try {
            Long totalPage = dao.get36PagingListCnt(tc);
            if(totalPage == null) totalPage = (long) 0;
            vo.setTotalPage(totalPage);
            agreementPagingListCnt.put("totalPage", totalPage);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return agreementPagingListCnt;
    }


    public HashMap<String, Object> getSearchCnt(CommonPagingVO vo) {
        AgreementPagingVO tc = (AgreementPagingVO) vo;
        HashMap<String, Object> agreementSearchPagingListCnt = new HashMap<String, Object>();

        try {
            Long totalPage = dao.get36SearchPagingListCnt(tc);
            if(totalPage == null) totalPage = (long) 0;
            vo.setTotalPage(totalPage);
            agreementSearchPagingListCnt.put("totalPage", totalPage);
        } catch(Exception e) {
            e.printStackTrace();
        }

        return agreementSearchPagingListCnt;
    }
}
