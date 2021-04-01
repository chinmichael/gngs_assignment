package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.AccountPagingVO;
import com.gngs.gngs_assignment.model.CommonPagingVO;
import com.gngs.gngs_assignment.repository.GngsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class AccountPaging extends PagingMap {

    @Autowired
    GngsDao dao;

    public HashMap<String, Object> getPagingCnt(CommonPagingVO vo) {
        AccountPagingVO tc = (AccountPagingVO) vo;
        HashMap<String, Object> accountPagingListCnt = new HashMap<String, Object>();

        try {
            Long totalPage = dao.getAccountPagingListCnt(tc);
            if(totalPage == null) totalPage = (long) 0;
            vo.setTotalPage(totalPage);
            accountPagingListCnt.put("totalPage", totalPage);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return accountPagingListCnt;
    }


    public HashMap<String, Object> getSearchCnt(CommonPagingVO vo) {
        AccountPagingVO tc = (AccountPagingVO) vo;
        HashMap<String, Object> accountSearchPagingCnt = new HashMap<String, Object>();

        try {
            Long totalPage;
            if(tc.getSearch_account_type() == null) {
                totalPage = dao.getAccountSearchPagingListCntNoType(tc);
            } else {
                totalPage = dao.getAccountSearchPagingListCnt(tc);
            }
            if(totalPage == null) totalPage = (long) 0;
            vo.setTotalPage(totalPage);
            accountSearchPagingCnt.put("totalPage", totalPage);

        } catch(Exception e) {
            e.printStackTrace();
        }

        return accountSearchPagingCnt;
    }
}
