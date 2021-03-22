package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.BpPagingVO;
import com.gngs.gngs_assignment.model.CommonPagingVO;
import com.gngs.gngs_assignment.repository.GngsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class BpPaging extends PagingMap {

    @Autowired
    GngsDao dao;

    @Override
    public HashMap<String, Object> getPagingCnt(CommonPagingVO vo) {
        BpPagingVO tc = (BpPagingVO) vo;
        HashMap<String, Object> bpPagingListCnt = new HashMap<String, Object>();

        try {
            Long totalPage = dao.getBpPagingListCnt(tc);
            if(totalPage == null) totalPage = (long) 0;
            vo.setTotalPage(totalPage);
            bpPagingListCnt.put("totalPage", totalPage);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bpPagingListCnt;
    }

    @Override
    public HashMap<String, Object> getSearchCnt(CommonPagingVO vo) {
        BpPagingVO tc = (BpPagingVO) vo;
        HashMap<String, Object> bpSearchPagingListCnt = new HashMap<String, Object>();

        try {
            Long totalPage;
            if(tc.getSearch_type1().equals("0")) {
                totalPage = dao.getBpSearchPagingListNoTypeCnt(tc);
            } else {
                totalPage = dao.getBpSearchPagingListCnt(tc);
            }
            vo.setTotalPage(totalPage);
            bpSearchPagingListCnt.put("totalPage", totalPage);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bpSearchPagingListCnt;
    }
}
