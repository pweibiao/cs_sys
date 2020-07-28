package org.peng.cs.domain;

import java.io.Serializable;

public class Goods implements Serializable {
    private Integer id;

    private String name;
    private Integer inventory;
    private Double price;

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", inventory=" + inventory +
                ", price=" + price +
                '}';
    }

    public Goods() {
    }

    /**
     * 商品
     * @param id 商品id
     * @param name 商品名称
     * @param inventory 商品库存
     * @param price 商品价格
     */
    public Goods(Integer id, String name, Integer inventory, Double price) {
        this.id = id;
        this.name = name;
        this.inventory = inventory;
        this.price = price;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getInventory() {
        return inventory;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
