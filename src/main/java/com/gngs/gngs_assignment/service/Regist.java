package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.AccountVO;
import com.gngs.gngs_assignment.model.AgreementVO;
import com.gngs.gngs_assignment.model.BpInformDetailVO;
import com.gngs.gngs_assignment.model.BpInformVO;

public interface Regist {

    //Ajax
    public String getZipAddress(String zipcode);

    //BP
    public BpInformDetailVO getBpInform(String uuid);
    public String selectBpId(String uuid);

    public Integer insertBpRuquest(BpInformVO vo);

    public Integer updateBpDetail(BpInformDetailVO vo);

    //BP Account
    public String getCheckAccount(String key);
    public AccountVO getBpAccount(String key);

    public Integer insertBpAccount(AccountVO vo);

    public Integer updateBpAccount(AccountVO vo);

    public Integer deleteBpAccount(AccountVO vo);

    //BP 36Agreement
    public String getCheckAgreement(String key);
    public AgreementVO getBpAgreement(AgreementVO vo);

    public Integer insertBpAgreement(AgreementVO vo);

    public Integer updateBpAgreement(AccountVO vo);

    public Integer deleteBpAgreement(AgreementVO vo);

    //Item
}
