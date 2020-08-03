package org.peng.cs.domain;

import java.io.Serializable;

public class OrderItem implements Serializable {
    /**
     * 唯一ID
     */
    private Integer itemId;
    /**
     * 对应商品总数
     */
    private Integer quantity;
    /**
     * 商品条目总价
     */
    private Double total;
    /**
     * 商品ID
     */
    private String goodsId;

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    private String goodsName;
    private Integer orderId;


    private Goods goodsById(Goods goods){
        goods.setName(goodsName);
        return goods;
    }
    private Order orderById(Order order){
        order.setId(orderId);
        return order;
    }

    public OrderItem() {
    }

    public OrderItem(Integer itemId, Integer quantity, Double total, String goodsName, Integer orderId) {
        this.itemId = itemId;
        this.quantity = quantity;
        this.total = total;
        this.goodsName = goodsName;
        this.orderId = orderId;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "itemId=" + itemId +
                ", quantity=" + quantity +
                ", total=" + total +
                ", goodsName='" + goodsName + '\'' +
                ", orderId=" + orderId +
                '}';
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
}
