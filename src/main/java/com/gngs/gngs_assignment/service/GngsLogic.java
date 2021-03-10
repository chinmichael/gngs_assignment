package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.SampleAccountVO;
import com.gngs.gngs_assignment.repository.GngsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GngsLogic {

    @Autowired
    private GngsDao dao;

    public List<SampleAccountVO> selectTest() {
        return dao.selectAccount();
    }
}
