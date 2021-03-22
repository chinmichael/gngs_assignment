package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.repository.GngsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GngsLogic {

    @Autowired
    private GngsDao dao;

}
