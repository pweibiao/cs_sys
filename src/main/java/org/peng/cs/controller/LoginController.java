package org.peng.cs.controller;

import org.peng.cs.domain.User;
import org.peng.cs.service.UserService;
import org.peng.cs.util.JsonMsg;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Login")
public class LoginController {

    @Resource
    private UserService userService;

    /**
     * 处理 登陆页面提交的登陆验证
     * @param request
     * @return
     */
    @RequestMapping("/dologin")
    @ResponseBody
    public JsonMsg login(HttpServletRequest request){
        String username = request.getParameter("userName");
        String password = request.getParameter("passWord");
        User user = userService.findUserByName(username);
        if (user == null){
            return JsonMsg.fail().addInfo("login_error", "输入账号用户名不存在，请重新输入！");
        }if (!user.getPassword().equals(password)){
            return JsonMsg.fail().addInfo("login_error", "输入账号用户名与密码不匹配，请重新输入！");
        }
        HttpSession session = request.getSession(true);
        session.setAttribute("session",username);
        session.setAttribute("session1",user.getDept());
        if(user.getDept().equals("owner")){
            return JsonMsg.successOwner();
        }else if (user.getDept().equals("user")){
            return JsonMsg.success();
        }else if (user.getDept().equals("admin")){
            return JsonMsg.successAdmin();
        }
        return JsonMsg.fail().addInfo("login_error", "输入账号用户名与密码不匹配，请重新输入！");
    }

    /**
     * 根据 user权限 返回
     * @return
     */
    @RequestMapping("/main")
    public ModelAndView main(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main");
        return mv;
    }

    /**
     * 根据 owner权限 返回
     * @return
     */
    @RequestMapping("/ownermain")
    public ModelAndView ownermain(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("owner");
        return mv;
    }

    /**
     * 根据 admin权限 返回
     * @return
     */
    @RequestMapping("/admin")
    public String admin(){
        return "manager";
    }

    /**
     * 请求 用户信息
     * @return
     */
    @RequestMapping("/info")
    public String info(){
        return "info";
    }

    /**
     * 请求 安全管理 页面
     * @return
     */
    @RequestMapping("/save")
    public String save(){
        return "save";
    }

    /**
     * 更改 个人登陆密码
     * @param request 获取用户信息
     * @return
     */
    @RequestMapping(value = "/change",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg change(HttpServletRequest request){
        String oldPassword = request.getParameter("oldPassword");
        String password = request.getParameter("password");
        String username = request.getSession().getAttribute("session").toString();
        User user = userService.findUserByName(username);
        if (!user.getPassword().equals(oldPassword)){
            return JsonMsg.fail().addInfo("login_error","旧密码错误，请重新输入");
        }else{
            user.setPassword(password);
            userService.updateUserById(user);
            return JsonMsg.success();
        }
    }

}
