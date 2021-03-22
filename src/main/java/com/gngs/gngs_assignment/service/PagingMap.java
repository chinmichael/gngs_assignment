package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.CommonPagingVO;

import java.util.HashMap;

abstract public class PagingMap {
    public abstract HashMap<String, Object> getPagingCnt (CommonPagingVO vo);
    public abstract HashMap<String, Object> getSearchCnt (CommonPagingVO vo);

    public HashMap<String, Object> getResMap(CommonPagingVO vo, HashMap<String, Object> listCnt) {
        HashMap<String, Object> resMap = new HashMap<String, Object>();

        resMap.put("total", listCnt.get("totalPage"));
        resMap.put("page", vo.getPage()); // Current Page
        resMap.put("pageScale", vo.getPageScale());

        int pageGroup =(int) Math.ceil((double) vo.getPage() / vo.getPageScale()); // Current Page Group
        resMap.put("pageGroup", pageGroup);

        long startPage = (pageGroup - 1) * vo.getPageScale() + 1;
        vo.setStartPage(startPage);
        resMap.put("startPage", vo.getStartPage());

        long endPage = startPage + vo.getPageScale() - 1;
        vo.setEndPage(endPage);
        resMap.put("endPage", vo.getEndPage());

        long prePage = (pageGroup - 2) * vo.getPageScale() + 1;
        long nextPage = (pageGroup) * vo.getPageScale() + 1;
        resMap.put("prePage", prePage);
        resMap.put("nextPage", nextPage);

        return resMap;
    }
}
