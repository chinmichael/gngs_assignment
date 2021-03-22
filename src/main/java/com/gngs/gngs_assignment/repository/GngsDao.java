package com.gngs.gngs_assignment.repository;

import com.gngs.gngs_assignment.model.BpInformDetailVO;
import com.gngs.gngs_assignment.model.BpInformVO;
import com.gngs.gngs_assignment.model.BpPagingVO;
import com.gngs.gngs_assignment.model.LoginVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GngsDao {
    String sampleIdPwCheck (LoginVO vo);
    LoginVO sampleLogin (LoginVO vo);

    List<BpInformDetailVO> getBpPagingList (BpPagingVO vo);
    Long getBpPagingListCnt (BpPagingVO vo);

    List<BpInformDetailVO> getBpSearchPagingList(BpPagingVO vo);
    Long getBpSearchPagingListCnt (BpPagingVO vo);
    List<BpInformDetailVO> getBpSearchPagingListNoType(BpPagingVO vo);
    Long getBpSearchPagingListNoTypeCnt(BpPagingVO vo);

    String lastBpIdCheck ();
    String bpUuidCheck(String uuid);
    Integer bpRequestInsert (BpInformVO vo);
    BpInformDetailVO showBpInform(BpInformVO vo);
}
