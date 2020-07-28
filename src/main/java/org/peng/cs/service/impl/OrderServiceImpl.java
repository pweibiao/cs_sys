package org.peng.cs.service.impl;


import org.peng.cs.domain.Order;
import org.peng.cs.mapper.OrderMapper;
import org.peng.cs.service.OrderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderMapper orderMapper;

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public void insertOrder(Order order) {
        orderMapper.insertOrder(order);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public void deleteOrderById(Integer id) {
        orderMapper.deleteOrderById(id);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public void updateOrderById(Order order) {
        orderMapper.updateOrderById(order);
    }

    @Override
    public Order findOrderById(Integer id) {
        return orderMapper.findOrderById(id);
    }

    @Override
    public List<Order> selectAllOrder() {
        return orderMapper.selectAllOrder();
    }

    @Override
    public Integer selectCountOrder() {
        return orderMapper.selectCountOrder();
    }

    @Override
    public List<Order> selectConnect() {
        return orderMapper.selectConnect();
    }

    @Override
    public List<Order> selectByUserId(Integer userId) {
        return orderMapper.selectByUserId(userId);
    }

    @Override
    public Integer selectIdByDate(String orderTime) {
        return orderMapper.selectIdByDate(orderTime);
    }
}
