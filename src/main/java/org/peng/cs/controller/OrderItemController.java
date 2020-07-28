package org.peng.cs.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.peng.cs.domain.Goods;
import org.peng.cs.domain.Order;
import org.peng.cs.domain.OrderItem;
import org.peng.cs.service.GoodsService;
import org.peng.cs.service.OrderItemService;
import org.peng.cs.service.OrderService;
import org.peng.cs.util.JsonMsg;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/OrderItem")
public class OrderItemController {

    @Resource
    private OrderItemService orderItemService;
    @Resource
    private GoodsService goodsService;
    @Resource
    private OrderService orderService;

    private Map<String,Object> result = new HashMap<String, Object>();

    @RequestMapping("/table")
    @ResponseBody
    public Map<String,Object> table(Integer page,Integer size,HttpServletRequest request){
        String id = request.getParameter("id");
        PageHelper.startPage(page,size);
        List<OrderItem> list = orderItemService.selectAllOrderItemByOrderId(Integer.valueOf(id));

        PageInfo<OrderItem> pageInfo = new PageInfo<OrderItem>();

        long total = pageInfo.getTotal();

        List<OrderItem> orderItemList = pageInfo.getList();

        result.put("page",total);
        result.put("size",orderItemList);
        result.put("code",0);
        result.put("msg","11");
        result.put("count",list.size());
        result.put("data",list);


        return result;
    }

    @RequestMapping("/allTake")
    public String allTake(){
        return "order/allTake";
    }

    @RequestMapping("/Retable")
    public String Retable(){
        return "order/Retable";
    }

    @RequestMapping("/Addtable")
    public String Addtable(){
        return "/order/Addtable";
    }

    @RequestMapping("/save")
    @ResponseBody
    public JsonMsg save(@RequestBody OrderItem orderItem) { //orderId goodsId quantity
                                                            //orderId goodsId quantity total
        Goods goods = goodsService.findGoodsById(Integer.valueOf(orderItem.getGoodsId()));
        Double goodsPrice = goods.getPrice();
        Double total = goodsPrice*orderItem.getQuantity();
        orderItem.setTotal(total);

        if (orderItem != null) {
            if (goods.getInventory() > 0) {
                try {
                    orderItemService.insertOrderItem(orderItem);
                    Order order = orderService.findOrderById(orderItem.getOrderId());
                    Double orderTotal = order.getTotal() + orderItem.getTotal();
                    order.setTotal(orderTotal);
                    orderService.updateOrderById(order);

                    goods.setInventory(goods.getInventory() - orderItem.getQuantity());
                    goodsService.updateGoodsById(goods);

                    return JsonMsg.success();
                } catch (Exception e) {
                    e.printStackTrace();
                    return JsonMsg.fail().addInfo("login_error", "输入数据有误！请重新输入。");
                }
            }else {
                return JsonMsg.fail().addInfo("login_error","商品无库存 请补货");
            }
        }
        return JsonMsg.fail().addInfo("login_error", "输入数据有误！请重新输入。");
    }


}
