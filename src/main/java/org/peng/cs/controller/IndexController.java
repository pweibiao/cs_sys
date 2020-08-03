package org.peng.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class IndexController {
    /**
     * 拦截请求 显示主页
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/")
    public ModelAndView GoToIndex(HttpServletRequest request, HttpServletResponse response){
        return new ModelAndView("index");
    }

}
