package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.*;

import java.util.List;

public interface PagingList {
    public List<BpInformDetailVO> getBpPagingList(BpPagingVO vo);
    public List<BpInformDetailVO> getBpPagingSearchList(BpPagingVO vo);

    public List<AccountVO> getAccountPagingList(AccountPagingVO vo);
    public List<AccountVO> getAccountPagingSearchList(AccountPagingVO vo);

    public List<AgreementVO> get36PagingList(AgreementPagingVO vo);
    public List<AgreementVO> get36SearchPagingList(AgreementPagingVO vo);

    public List<BpInformDetailVO> getBpCodePagingList(BpCodePagingVO vo);
}
