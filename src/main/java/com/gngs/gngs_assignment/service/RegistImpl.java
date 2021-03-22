package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.BpInformDetailVO;
import com.gngs.gngs_assignment.model.BpInformVO;
import com.gngs.gngs_assignment.repository.GngsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;

@Service
public class RegistImpl implements Regist {

    @Autowired
    GngsDao dao;

    public Integer bpRuquestInsert(BpInformVO vo) {
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

    public BpInformDetailVO showBpInform(BpInformVO vo) {
        BpInformDetailVO result = dao.showBpInform(vo);

        int mailIdx = result.getContract_mail().indexOf("@");
        result.setMailAddress1(result.getContract_mail().substring(0,mailIdx));
        result.setMailAddress2(result.getContract_mail().substring(mailIdx+1));

        String[] telArray = result.getContract_tel().split("-");
        result.setContractTel1(telArray[0]); result.setContractTel2(telArray[1]); result.setContractTel3(telArray[2]);

        return result;
    }

    public String pullBpId(String uuid) {
        String bpId = dao.bpUuidCheck(uuid);
        if(bpId == null || bpId.isEmpty()) bpId="";
        return bpId;
    }
}
