package com.gngs.gngs_assignment.service;

import com.gngs.gngs_assignment.model.LoginVO;

public interface Login {
    public Integer sampleIdPwCheck(LoginVO vo);
    public LoginVO sampleLogin(LoginVO vo);
}
