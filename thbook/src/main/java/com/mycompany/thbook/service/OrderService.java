package com.mycompany.thbook.service;

import com.mycompany.thbook.repository.*;
import com.mycompany.thbook.entities.OrderEntity;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    public OrderEntity saveOrder(OrderEntity order) {
        return orderRepository.save(order);
    }

    public List<OrderEntity> getOrders() {
        return (List<OrderEntity>) orderRepository.findAll();
    }
    
     public List<OrderEntity> getOrdersByUserName(String username) {
        return (List<OrderEntity>) orderRepository.findProductByUserName(username);
    }
     
      public List<OrderEntity> getOrdersByCtv() {
        return (List<OrderEntity>) orderRepository.getOrdersByCtv();
    }
    
    
    

    public Page<OrderEntity> getOrders(int page) {
        Pageable pageable = new PageRequest(page - 1, 9, Sort.Direction.DESC, "orderDate");
        return (Page<OrderEntity>) orderRepository.findAll(pageable);
    }

    public OrderEntity getOrderById(int id) {
        return orderRepository.findById(id);
    }

    public OrderEntity getOrderByIdAndEmail(int id, String email) {
        return orderRepository.findOrderByIdAndEmail(id, email);
    }

    public void deleteOrderById(int id) {
        orderRepository.delete(id);
    }
}
