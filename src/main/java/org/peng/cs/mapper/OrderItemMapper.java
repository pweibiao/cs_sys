package org.peng.cs.mapper;


import org.peng.cs.domain.OrderItem;

import java.util.List;

public interface OrderItemMapper {

    public void insertOrderItem(OrderItem orderItem);

    public void deleteOrderItemById(Integer id) ;

    public void updateOrderItemById(OrderItem orderItem) ;

    public List<OrderItem> findOrderItemById(Integer id) ;

    public List<OrderItem> selectAllOrderItem() ;

    public Integer selectCountOrderItem();

    public List<OrderItem> selectAllOrderItemByOrderId(Integer orderId);

}
