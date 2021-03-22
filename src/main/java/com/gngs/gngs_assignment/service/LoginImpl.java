package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.LoginVO;
import com.gngs.gngs_assignment.repository.GngsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginImpl implements Login {

    @Autowired
    GngsDao dao;

    public Integer sampleIdPwCheck(LoginVO vo) {
        Integer result;
        String check = dao.sampleIdPwCheck(vo);
        if(check == null || check.isEmpty()) result = 0;
        else if(!check.equals(vo.getUserpw())) result = 1;
        else result = 2;
        return result;
    }

    public LoginVO sampleLogin(LoginVO vo) {
        LoginVO enter = dao.sampleLogin(vo);
        return enter;
    }
}
