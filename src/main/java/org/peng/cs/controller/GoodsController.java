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

    /**
     * 请求 商品数据信息
     * @return
     */
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

    /**
     * 请求 商品信息进行分页数据处理
     * @param page 页数
     * @param size 每页展示信息数
     * @return
     */
    @RequestMapping("/table")
    @ResponseBody
    public Map<String,Object> table(Integer page,Integer size){
        //分页插件 PageHelper
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

    /**
     * 请求 商品添加页面
     * @return
     */
    @RequestMapping("/addtable")
    public String addtable(){
        return "goods/addtable";
    }

    /**
     * 请求 所有商品信息
     * @return
     */
    @RequestMapping("/allTake")
    public String allTake(){
        return "goods/allTake";
    }

    /**
     * 请求 订单信息页面
     * @return JSP页面
     */
    @RequestMapping("/Retable")
    public String Retable(){
        return "goods/laypagetable";
    }

    /**
     * 请求 商品编辑页面
     * @return
     */
    @RequestMapping("/deletetable")
    public String deletetable(){
        return "goods/deletetable";
    }

    /**
     * 用户删除 指定商品信息系
     * @param request 提供商品唯一ID
     * @return
     */
    @RequestMapping("/dodelete")
    @ResponseBody
    public JsonMsg dodelete(HttpServletRequest request){
        String id = request.getParameter("id");
        goodsService.deleteGoodsById(Integer.valueOf(id));
        return JsonMsg.success();
    }

    /**
     * 用户提交 添加的商品信息
     * @param goods 商品信息
     * @return
     */
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

    /**
     * 用户修改 指定商品信息
     * @param request  提供商品唯一ID
     * @return
     */
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
