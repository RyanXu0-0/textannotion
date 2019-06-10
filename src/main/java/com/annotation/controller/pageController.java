package com.annotation.controller;

import com.annotation.quartz.QuartzJobManager;
import com.annotation.quartz.TestQuartz;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by twinkleStar on 2019/1/9.
 */
@RestController
@RequestMapping("/page")
public class pageController {

    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public ModelAndView loginPage(HttpServletRequest request, HttpServletResponse response,int tid){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login");

        mav.addObject("time", tid);
        return mav;
    }

    @GetMapping("/task")
    public void task(HttpServletRequest request) throws Exception {
        String name = "test";
        QuartzJobManager.getInstance().addJob(TestQuartz.class, name,name, "*/1 * * * * ?");
    }

}
