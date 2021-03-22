package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.BpInformDetailVO;
import com.gngs.gngs_assignment.model.BpPagingVO;

import java.util.List;

public interface PagingList {
    public List<BpInformDetailVO> getBpPagingList(BpPagingVO vo);
    public List<BpInformDetailVO> getBpPagingSearchList(BpPagingVO vo);
}
