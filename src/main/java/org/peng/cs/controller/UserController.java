package org.peng.cs.controller;

import com.github.pagehelper.PageHelper;

import com.github.pagehelper.PageInfo;
import org.peng.cs.domain.User;
import org.peng.cs.service.UserService;
import org.peng.cs.util.JsonMsg;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/User")
public class UserController {

    @Resource
    private UserService userService;

    private Map<String,Object> result = new HashMap<String,Object>();

    @RequestMapping("/usertable")
    public String usertable(){
        return "user/usertable";
    }

    @RequestMapping("/addtable")
    public String addtable(){
        return "user/addtable";
    }

    @RequestMapping("/table")
    @ResponseBody
    public Map<String,Object> table(Integer page,Integer size){
        //分页
        PageHelper.startPage(page,size);
        List<User> list = userService.selectAllUser();

        PageInfo<User> pageInfo = new PageInfo<User>();

        long total = pageInfo.getTotal();

        List<User> userList = pageInfo.getList();

        result.put("page",total);
        result.put("size",userList);
        result.put("code",0);
        result.put("msg","11");
        result.put("count",userService.selectAllCount());
        result.put("data",list);

        return result;
    }

    @RequestMapping("/dodelete")
    @ResponseBody
    public JsonMsg dodelete(HttpServletRequest request){
        String id = request.getParameter("id");
        userService.deleteUserByName(Integer.valueOf(id));
        return JsonMsg.success();
    }

    @RequestMapping(value = "/doadd",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg doadd(@RequestBody User user){

        if (user!=null){
            try {
                userService.insertUser(user);
                return JsonMsg.success();
            }catch (Exception e){
                e.printStackTrace();
                return JsonMsg.fail().addInfo("login_erroe","输入数据有误！请重新输入。");
            }
        }
        return JsonMsg.fail().addInfo("login_erroe","输入数据有误！请重新输入。");
    }

}
