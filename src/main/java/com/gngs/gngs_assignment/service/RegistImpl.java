package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.*;
import com.gngs.gngs_assignment.repository.GngsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;

@Service
public class RegistImpl implements Regist {

    @Autowired
    GngsDao dao;

    //Ajax
    public String getZipAddress(String zipcode) {
        ZipcodeVO vo = dao.getZipAddress(zipcode);

        if(vo == null) {
            return "";
        }

        if(vo.getKen() == null || vo.getKen().isEmpty()) vo.setKen("");
        if(vo.getSi() == null || vo.getSi().isEmpty()) vo.setSi("");
        if(vo.getMachi() == null || vo.getMachi().isEmpty()) vo.setMachi("");

        String address = vo.getKen() + vo.getSi() + vo.getMachi();

        return address;
    }

    //BP
    public BpInformDetailVO getBpInform(String uuid) {
        BpInformDetailVO result = dao.showBpInform(uuid);

        if(result.getCorporate_birth() != null && !result.getCorporate_birth().isEmpty()) {
            String[] birth = result.getCorporate_birth().split(" ");
            result.setCorporate_birth(birth[0]);
        }

        /*int mailIdx = result.getContract_mail().indexOf("@");
        result.setMailAddress1(result.getContract_mail().substring(0,mailIdx));
        result.setMailAddress2(result.getContract_mail().substring(mailIdx+1));*/
        String[] telArray;

        if(result.getContract_tel() != null && !result.getContract_tel().isEmpty()) {
            telArray = result.getContract_tel().split("-");
            result.setContractTel1(telArray[0]); result.setContractTel2(telArray[1]); result.setContractTel3(telArray[2]);
        }
        if(result.getContract_phone() != null && !result.getContract_phone().isEmpty()) {
            telArray = result.getContract_phone().split("-");
            result.setContractPhone1(telArray[0]);result.setContractPhone2(telArray[1]);result.setContractPhone3(telArray[2]);
        }
        if(result.getCorporate_tel() != null && !result.getCorporate_tel().isEmpty()) {
            telArray = result.getCorporate_tel().split("-");
            result.setCorporateTel1(telArray[0]);result.setCorporateTel2(telArray[1]);result.setCorporateTel3(telArray[2]);
        }
        if(result.getCorporate_fax() != null && !result.getCorporate_fax().isEmpty()) {
            telArray = result.getCorporate_fax().split("-");
            result.setCorporateFax1(telArray[0]);result.setCorporateFax2(telArray[1]);result.setCorporateFax3(telArray[2]);
        }
        if(result.getDispatch_tel() != null && !result.getDispatch_tel().isEmpty()) {
            telArray = result.getDispatch_tel().split("-");
            result.setDispatchTel1(telArray[0]);result.setDispatchTel2(telArray[1]);result.setDispatchTel3(telArray[2]);
        }

        return result;
    }

    public String selectBpId(String uuid) {
        String bpId = dao.bpUuidCheck(uuid);
        if(bpId == null || bpId.isEmpty()) bpId="";
        return bpId;
    }

    public Integer insertBpRuquest(BpInformVO vo) {
        vo.setProcedure_status(0);
        vo.setDeal_status(0);

        String bpType = "";
        String compType = "";
        String seq = "";
        String yy = "";

        if(vo.getBp_type() == 0) bpType = "C";
        else bpType = "P";

        if(vo.getCorporate_type1() == 0) compType = "H";
        else if(vo.getCorporate_type1() == 1) compType = "S";
        else compType = "E";

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        yy = Integer.toString(year);
        yy = yy.substring(yy.length() - 2, yy.length());

        String bpId = dao.lastBpIdCheck();
        if(bpId == null || bpId.isEmpty()) {
            seq = "001";
        } else {
            bpId = bpId.substring(bpId.length()-3, bpId.length());
            int seqCheck = Integer.parseInt(bpId);
            seqCheck = seqCheck + 1;
            seq = Integer.toString(seqCheck);
            if(seq.length() == 1) seq = "0"+"0"+seq;
            else if(seq.length() == 2) seq = "0"+seq;
        }

        String bpCode = "B" + bpType + compType + yy + seq;
        vo.setBp_id(bpCode);

        System.out.println(vo.getBp_id());

        Integer check = dao.bpRequestInsert(vo);
        return check;
    }

    public Integer updateBpDetail(BpInformDetailVO vo) {
        return null;
    }


    //BP Account
    public String getCheckAccount(String key) {
        String accountBpId = dao.checkAccount(key);
        if(accountBpId == null || accountBpId.isEmpty()) {
            accountBpId = "";
        }
        return accountBpId;
    }
    public AccountVO getBpAccount(String key) {
        return null;
    }

    public Integer insertBpAccount(AccountVO vo) {
        return null;
    }

    public Integer updateBpAccount(AccountVO vo) {
        return null;
    }

    public Integer deleteBpAccount(AccountVO vo) {
        return null;
    }

    //BP Agreement
    public String getCheckAgreement(String key) {
        AgreementVO vo = dao.checkAgreement(key);
        if(vo == null) {
            return "";
        }
        return vo.getStart_date();
    }
    public AgreementVO getBpAgreement(AgreementVO vo) {
        return null;
    }

    public Integer insertBpAgreement(AgreementVO vo) {
        return null;
    }

    public Integer updateBpAgreement(AccountVO vo) {
        return null;
    }

    public Integer deleteBpAgreement(AgreementVO vo) {
        return null;
    }


}
