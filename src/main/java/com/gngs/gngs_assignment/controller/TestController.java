package com.gngs.gngs_assignment.controller;

import com.gngs.gngs_assignment.model.SampleAccountVO;
import com.gngs.gngs_assignment.service.GngsLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class TestController {

    /*@RequestMapping(value="/home")
    public String home() {
        return "index.html";
    }

    @ResponseBody
    @RequestMapping("/valueTest")
    public String valueTest() {
        String value="Test String";
        return value;
    }*/

    /*@RequestMapping("/test")
    public ModelAndView test() throws Exception {
        ModelAndView mav = new ModelAndView("test");
        mav.addObject("name", "chinmichael");

        List<String> testList = new ArrayList<String>();
        testList.add("a");
        testList.add("b");
        testList.add("c");

        mav.addObject("list", testList);
        return mav;
    }*/

    @Autowired
    GngsLogic logic;

    @RequestMapping(value="/test")
    public ModelAndView test() throws Exception{
        ModelAndView mav = new ModelAndView("test");
        List<SampleAccountVO> testList = logic.selectTest();
        mav.addObject("list", testList);
        return mav;
    }

    @RequestMapping(value="/coverTop")
    public ModelAndView coverTest2() {
        ModelAndView mav = new ModelAndView("coverTop");
        return mav;
    }

    @RequestMapping(value="/cover")
    public ModelAndView coverTest() {
        ModelAndView mav = new ModelAndView("cover");
        return mav;
    }


}
