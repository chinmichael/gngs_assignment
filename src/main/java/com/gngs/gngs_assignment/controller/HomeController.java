package com.gngs.gngs_assignment.controller;

import com.gngs.gngs_assignment.model.LoginVO;
import com.gngs.gngs_assignment.service.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class HomeController {

    @Autowired
    Login login;

    @RequestMapping(value="/cover")
    public ModelAndView cover() {
        ModelAndView mav = new ModelAndView("cover");
        return mav;
    }

    @RequestMapping(value="/loginForm")
    public ModelAndView sampleLoginForm() throws Exception {
        ModelAndView mav = new ModelAndView("loginForm");
        mav.addObject(new LoginVO());
        return mav;
    }

    @RequestMapping(value="/login")
    public ModelAndView sampleLogin(@Valid @ModelAttribute LoginVO vo, BindingResult br, HttpSession session) throws Exception {
        ModelAndView mav;

        if(br.hasErrors()) {
            mav = new ModelAndView("loginForm");
            mav.getModel().putAll(br.getModel());
            return mav;
        }

        Integer check = login.sampleIdPwCheck(vo);
        if(check == 0) {
            mav = new ModelAndView("loginForm");
            mav.addObject("loginError", "IDをチェックしてください");
            return mav;
        } else if(check == 1) {
            mav = new ModelAndView("loginForm");
            mav.addObject("loginError", "パスワードをチェックしてください");
            return mav;
        }

        LoginVO enter = login.sampleLogin(vo);

        mav = new ModelAndView("cover");
        session.setAttribute("login", enter);
        session.setMaxInactiveInterval(24*60*60);

        return mav;
    }

    @RequestMapping(value="/logout")
    public ModelAndView sampleLogout(HttpSession session) {
        ModelAndView mav = new ModelAndView("loginForm");
        session.invalidate();
        mav.addObject(new LoginVO());
        return mav;
    }
}
