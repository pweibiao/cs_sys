package org.peng.cs.service.impl;



import org.peng.cs.domain.OrderItem;
import org.peng.cs.mapper.OrderItemMapper;


import org.peng.cs.service.OrderItemService;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.List;

@Service("orderItemService")
public class OrderItemServiceImpl implements OrderItemService {

    @Resource
    private OrderItemMapper orderItemMapper;

    @Override
    public void insertOrderItem(OrderItem orderItem) {
        orderItemMapper.insertOrderItem(orderItem);
    }

    @Override
    public void deleteOrderItemById(Integer id) {
        orderItemMapper.deleteOrderItemById(id);
    }

    @Override
    public void updateOrderItemById(OrderItem orderItem) {
        orderItemMapper.updateOrderItemById(orderItem);
    }

    @Override
    public List<OrderItem> findOrderItemById(Integer id) {
        return orderItemMapper.findOrderItemById(id);
    }

    @Override
    public List<OrderItem> selectAllOrderItem() {
        return orderItemMapper.selectAllOrderItem();
    }

    @Override
    public Integer selectCountOrderItem() {
        return orderItemMapper.selectCountOrderItem();
    }

    @Override
    public List<OrderItem> selectAllOrderItemByOrderId(Integer orderId) {
        return orderItemMapper.selectAllOrderItemByOrderId(orderId);
    }


}
