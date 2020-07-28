package org.peng.cs.service;

import org.peng.cs.domain.Order;

import java.util.List;

public interface OrderService {

    public void insertOrder(Order order);

    public void deleteOrderById(Integer id);

    public void updateOrderById(Order order);

    public Order findOrderById(Integer id);

    public List<Order> selectAllOrder();

    public Integer selectCountOrder();

    public List<Order> selectConnect();

    public List<Order> selectByUserId(Integer userId);

    public Integer selectIdByDate(String orderTime);

}
