package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.repository.GngsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class SecurityImpl implements Security {

    @Autowired
    GngsDao dao;

    public String createBpUuid() {

        String bpUuid = "";
        boolean flg = true;

        while(flg) {
            String uuid1 = UUID.randomUUID().toString().replace("-","");
            String uuid2 = UUID.randomUUID().toString().replace("-","");
            bpUuid = uuid1 + uuid2;

            if(dao.bpUuidCheck(bpUuid) == null || dao.bpUuidCheck(bpUuid).isEmpty()) {
                flg = false;
            }
        }

        return bpUuid;
    }
}
