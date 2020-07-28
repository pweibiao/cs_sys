package org.peng.cs.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.peng.cs.domain.Goods;
import org.peng.cs.service.GoodsService;
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
@RequestMapping("/Goods")
public class GoodsController {

    @Resource
    private GoodsService goodsService;

    private Map<String,Object> result = new HashMap<String,Object>();

    @RequestMapping("/easytable")
    @ResponseBody
    public Map<String,Object> easytable(){

        List<Goods> list = goodsService.selectAllGoods();

        result.put("code",0);
        result.put("msg","11");
        result.put("count",goodsService.selectCountGoods());
        result.put("data",list);

        return result;
    }

    @RequestMapping("/table")
    @ResponseBody
    public Map<String,Object> table(Integer page,Integer size){
        //分页
        PageHelper.startPage(page,size);
        List<Goods> list = goodsService.selectAllGoods();

        PageInfo<Goods> pageInfo = new PageInfo<Goods>();

        long total = pageInfo.getTotal();

        List<Goods> goodsList = pageInfo.getList();

        result.put("page",total);
        result.put("size",goodsList);
        result.put("code",0);
        result.put("msg","11");
        result.put("count",goodsService.selectCountGoods());
        result.put("data",list);

        return result;
    }

    @RequestMapping("/addtable")
    public String addtable(){
        return "goods/addtable";
    }

    @RequestMapping("/allTake")
    public String allTake(){
        return "goods/allTake";
    }

    @RequestMapping("/Retable")
    public String Retable(){
        return "goods/laypagetable";
    }

    @RequestMapping("/deletetable")
    public String deletetable(){
        return "goods/deletetable";
    }

    @RequestMapping("/dodelete")
    @ResponseBody
    public JsonMsg dodelete(HttpServletRequest request){
        String id = request.getParameter("id");
        goodsService.deleteGoodsById(Integer.valueOf(id));
        return JsonMsg.success();
    }

    @RequestMapping(value = "/doadd",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg doadd(@RequestBody Goods goods){

        if (goods!=null){
            try {
                goodsService.insertGoods(goods);
                return JsonMsg.success();
            }catch (Exception e){
                e.printStackTrace();
                return JsonMsg.fail().addInfo("login_erroe","输入数据有误！请重新输入。");
            }
        }
        return JsonMsg.fail().addInfo("login_erroe","输入数据有误！请重新输入。");
    }

    @RequestMapping(value = "/doupdate",method = RequestMethod.POST)
    @ResponseBody
    public JsonMsg doupdate(HttpServletRequest request){

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String inventory = request.getParameter("inventory");
        String price = request.getParameter("price");

        Goods goods = new Goods();

        goods.setId(Integer.valueOf(id));
        goods.setInventory(Integer.valueOf(inventory));
        goods.setPrice(Double.valueOf(price));
        goods.setName(name);

        goodsService.updateGoodsById(goods);

        return JsonMsg.success();
    }

}
