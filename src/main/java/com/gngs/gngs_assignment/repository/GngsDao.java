package com.gngs.gngs_assignment.repository;

import com.gngs.gngs_assignment.model.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GngsDao {
    //Sample Login
    String sampleIdPwCheck (LoginVO vo);
    LoginVO sampleLogin (LoginVO vo);

    //Paging
    List<BpInformDetailVO> getBpPagingList (BpPagingVO vo);
    Long getBpPagingListCnt (BpPagingVO vo);
    List<BpInformDetailVO> getBpSearchPagingList(BpPagingVO vo);
    Long getBpSearchPagingListCnt (BpPagingVO vo);
    List<BpInformDetailVO> getBpSearchPagingListNoType(BpPagingVO vo);
    Long getBpSearchPagingListNoTypeCnt(BpPagingVO vo);

    List<AccountVO> getAccountPagingList(AccountPagingVO vo);
    Long getAccountPagingListCnt (AccountPagingVO vo);
    List<AccountVO> getAccountSearchPagingList(AccountPagingVO vo);
    Long getAccountSearchPagingListCnt(AccountPagingVO vo);
    List<AccountVO> getAccountSearchPagingListNoType(AccountPagingVO vo);
    Long getAccountSearchPagingListCntNoType(AccountPagingVO vo);

    List<AccountVO> get36PagingList(AgreementPagingVO vo);
    Long get36PagingListCnt (AgreementPagingVO vo);
    List<AccountVO> get36SearchPagingList(AgreementPagingVO vo);
    Long get36SearchPagingListCnt(AgreementPagingVO vo);

    //Ajax
    ZipcodeVO getZipAddress (String zipcode);

    //BP Inform Logic
    String lastBpIdCheck ();
    String bpUuidCheck(String uuid);
    Integer bpRequestInsert (BpInformVO vo);
    BpInformDetailVO showBpInform(BpInformVO vo);

    //BP Account Logic


    //BP 36Agreement Logic


    //Item Management
}
