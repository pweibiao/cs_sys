package org.peng.cs.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.peng.cs.domain.Order;
import org.peng.cs.domain.User;
import org.peng.cs.service.OrderService;
import org.peng.cs.service.UserService;
import org.peng.cs.util.JsonMsg;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Order")
public class OrderController {

    @Resource
    private OrderService orderService;
    @Resource
    private UserService userService;


    private Map<String,Object> result = new HashMap<String, Object>();

    @RequestMapping("/easytable")
    @ResponseBody
    public Map<String,Object> easytable(){

        List<Order> list = orderService.selectConnect();

        result.put("code",0);
        result.put("msg","11");
        result.put("count",orderService.selectCountOrder());
        result.put("data",list);

        return result;

    }

    @RequestMapping("/table")
    @ResponseBody
    public Map<String,Object> table(Integer page,Integer size){
        //分页
        PageHelper.startPage(page,size);
        List<Order> list = orderService.selectConnect();

        PageInfo<Order> pageInfo = new PageInfo<Order>();

        long total = pageInfo.getTotal();

        List<Order> orderList = pageInfo.getList();

        result.put("page",total);
        result.put("size",orderList);
        result.put("code",0);
        result.put("msg","11");
        result.put("count",orderService.selectCountOrder());
        result.put("data",list);

        return result;

    }

    @RequestMapping("/userTable")
    @ResponseBody
    public Map<String,Object> userTable(HttpServletRequest request, Integer page, Integer size){
        String username = request.getParameter("username");
        User user = userService.findUserByName(username);

        //分页
        PageHelper.startPage(page,size);
        List<Order> list = orderService.selectByUserId(user.getId());

        PageInfo<Order> pageInfo = new PageInfo<Order>();

        long total = pageInfo.getTotal();

        List<Order> orderList = pageInfo.getList();

        result.put("page",total);
        result.put("size",orderList);
        result.put("code",0);
        result.put("msg","11");
        result.put("count",orderService.selectCountOrder());
        result.put("data",list);

        return result;

    }

    @RequestMapping("/Add")
    @ResponseBody
    public JsonMsg Add(HttpServletRequest request){
        String username = request.getParameter("userName");
        User user = userService.findUserByName(username);
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        Integer userId = user.getId();

        Order order = new Order(time,userId,new Double(0));

        orderService.insertOrder(order);
        Integer orderId = orderService.selectIdByDate(order.getOrderTime());

        return JsonMsg.success().addInfo("addSuccess",Integer.toString(orderId));
    }



}
