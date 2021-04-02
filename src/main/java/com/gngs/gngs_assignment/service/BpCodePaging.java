package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.BpCodePagingVO;
import com.gngs.gngs_assignment.model.CommonPagingVO;
import com.gngs.gngs_assignment.repository.GngsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class BpCodePaging extends PagingMap {

    @Autowired
    GngsDao dao;

    public HashMap<String, Object> getPagingCnt(CommonPagingVO vo) {
        return null;
    }

    public HashMap<String, Object> getSearchCnt(CommonPagingVO vo) {
        BpCodePagingVO tc = (BpCodePagingVO) vo;
        HashMap<String, Object> bpCodePagingCnt = new HashMap<String, Object>();

        try {
            Long totalPage;
            if(tc.getCode_search_type1().equals("0")) {
                totalPage = dao.getBpCodeCntNoType(tc);
            } else {
                totalPage = dao.getBpCodeCnt(tc);
            }
            if(totalPage == null) totalPage = (long) 0;
            vo.setTotalPage(totalPage);
            bpCodePagingCnt.put("totalPage", totalPage);

        } catch(Exception e) {
            e.printStackTrace();
        }

        return bpCodePagingCnt;
    }
}