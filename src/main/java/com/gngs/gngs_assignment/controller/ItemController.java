package com.gngs.gngs_assignment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/item")
public class ItemController {

    @RequestMapping("/itemList")
    public ModelAndView itemTest() {
        ModelAndView mav = new ModelAndView("item/itemList");
        return mav;
    }
}
