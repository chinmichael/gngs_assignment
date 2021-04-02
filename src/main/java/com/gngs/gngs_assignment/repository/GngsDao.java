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

    List<AgreementVO> get36PagingList(AgreementPagingVO vo);
    Long get36PagingListCnt (AgreementPagingVO vo);
    List<AgreementVO> get36SearchPagingList(AgreementPagingVO vo);
    Long get36SearchPagingListCnt(AgreementPagingVO vo);

    //Ajax
    ZipcodeVO getZipAddress (String zipcode);
    List<BpInformDetailVO> getBpCode(BpCodePagingVO vo);
    Long getBpCodeCnt(BpCodePagingVO vo);
    List<BpInformDetailVO> getBpCodeNoType(BpCodePagingVO vo);
    Long getBpCodeCntNoType(BpCodePagingVO vo);

    //BP Inform Logic
    String lastBpIdCheck ();
    String bpUuidCheck(String uuid);
    BpInformDetailVO showBpInform(BpInformVO vo);
    Integer bpRequestInsert (BpInformVO vo);
    Integer bpAdminUpdate (BpInformDetailVO vo);
    Integer bpPartnerUpdate (BpInformDetailVO vo);
    Integer deleteBP (BpInformVO vo);

    //BP Account Logic
    AccountVO showAccount (AccountVO vo);
    Integer accountRegist(AccountVO vo);
    Integer updateAccount (AccountVO vo);
    Integer deleteAccount (AccountVO vo);

    //BP 36Agreement Logic
    AgreementVO agreementCheck (AgreementVO vo);
    AgreementVO agreementDateCheck (AgreementVO vo);
    AgreementVO showAgreement (AgreementVO vo);
    Integer agreementRegist (AgreementVO vo);
    Integer updateAgreement (AgreementVO vo);
    Integer deleteAgreement (AgreementVO vo);

    //Item Management
}
