package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.BpInformDetailVO;
import com.gngs.gngs_assignment.model.BpInformVO;

public interface Regist {
    public Integer bpRuquestInsert(BpInformVO vo);
    public BpInformDetailVO showBpInform(BpInformVO vo);
    public String pullBpId(String uuid);
}
