package com.mycompany.thbook.service;

import com.mycompany.thbook.repository.*;
import com.mycompany.thbook.entities.OrderDetailEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailService {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    public OrderDetailEntity save(OrderDetailEntity orderDetail) {
        return (OrderDetailEntity) orderDetailRepository.save(orderDetail);
    }
}
