package com.itdr.pojo.VO;

import com.itdr.pojo.Customer;
import com.itdr.pojo.Order;
import com.itdr.pojo.OrderItem;
import com.itdr.pojo.Shipping;

import java.util.List;

public class ListVO {
    private Shipping shipping;
    private Customer customer;
    private List<OrderItem> orderItem;
    private Order order;

    public Shipping getShipping() {
        return shipping;
    }

    public void setShipping(Shipping shipping) {
        this.shipping = shipping;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<OrderItem> getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(List<OrderItem> orderItem) {
        this.orderItem = orderItem;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
