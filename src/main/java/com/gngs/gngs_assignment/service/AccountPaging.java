package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.CommonPagingVO;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class AccountPaging extends PagingMap {

    public HashMap<String, Object> getPagingCnt(CommonPagingVO vo) {
        return null;
    }


    public HashMap<String, Object> getSearchCnt(CommonPagingVO vo) {
        return null;
    }
}
