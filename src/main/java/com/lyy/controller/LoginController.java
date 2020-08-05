package com.lyy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: ssword04
 * @description
 * @author: lyy
 * @create: 2020-08-05 15:46
 **/
@Controller
public class LoginController {
    @RequestMapping("login.do")
    public String login(){
        return "index";
    }
}
