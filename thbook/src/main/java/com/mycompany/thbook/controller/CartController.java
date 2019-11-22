/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.thbook.controller;

import com.mycompany.thbook.entities.AccountEntity;
import com.mycompany.thbook.entities.OrderDetailEntity;
import com.mycompany.thbook.entities.OrderEntity;
import com.mycompany.thbook.entities.ProductEntity;
import com.mycompany.thbook.entities.enums.OrderStatus;
import com.mycompany.thbook.service.AccountService;
import com.mycompany.thbook.service.OrderService;
import com.mycompany.thbook.service.ProductService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartController {
    
    @Autowired
    private AccountService accountService;
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private OrderService orderService;
    
    @RequestMapping(value = "/addToCart/{bookId}", method = RequestMethod.GET)
    public Object addToCartPage(Model model, HttpSession session, @PathVariable(value = "bookId") int bookId) {
        ProductEntity product = productService.getProductById(bookId);
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        orderDetail.setProduct(product);
        orderDetail.setQuantity(1);
        if (session.getAttribute("order") == null) {
            List<OrderDetailEntity> orderDetails = new ArrayList<>();
            orderDetails.add(orderDetail);
            OrderEntity order = new OrderEntity();
            order.setStatus(OrderStatus.PENDING);
            order.setOrderDetails(orderDetails);
            session.setAttribute("order", order);
        } else {
            OrderEntity order = (OrderEntity) session.getAttribute("order");
            List<OrderDetailEntity> orderDetails = order.getOrderDetails();
            boolean temp = true;
            for (OrderDetailEntity orderDetail1 : orderDetails) {
                if (orderDetail1.getProduct().getId() == orderDetail.getProduct().getId()) {
                    temp = false;
                }
            }
            if (temp) {
                orderDetails.add(orderDetail);
                order.setOrderDetails(orderDetails);
            }
            order.setStatus(OrderStatus.PENDING);
            session.setAttribute("order", order);
        }
        return "redirect:/";
    }
    
    @RequestMapping(value = "/deteteBookOnCart/{bookId}", method = RequestMethod.GET)
    public Object deteteBookOnCart(Model model, HttpSession session, @PathVariable(value = "bookId") int bookId) {
        
        if (session.getAttribute("order") != null) {
            OrderEntity order = (OrderEntity) session.getAttribute("order");
            List<OrderDetailEntity> orderDetails = order.getOrderDetails();
            
            for (int i = 0; i < orderDetails.size(); i++) {
                if (orderDetails.get(i).getProduct().getId() == bookId) {
                    orderDetails.remove(i);
                }
            }
            order.setOrderDetails(orderDetails);
            session.setAttribute("order", order);
            
        }
        System.out.println("1231242345346" + bookId);
        return "redirect:/";
    }
    
    @RequestMapping(value = "/updateBookOnCart/", method = RequestMethod.POST)
    public Object updateBookOnCart(Model model, HttpSession session,
            @RequestParam(name = "quantity", required = false) int[] quantity) {
        if (session.getAttribute("order") != null) {
            OrderEntity order = (OrderEntity) session.getAttribute("order");
            List<OrderDetailEntity> orderDetails = order.getOrderDetails();
            boolean temp = true;
            for (int i = 0; i < orderDetails.size(); i++) {
                orderDetails.get(i).setQuantity(quantity[i]);
            }
            order.setStatus(OrderStatus.PENDING);
            session.setAttribute("order", order);
        }
        return "redirect:/";
    }
    
    @RequestMapping(value = "/checkout/", method = RequestMethod.GET)
    public Object checkoutPage(Model model, HttpSession session) {
        return "checkout";
    }
    
    @RequestMapping(value = "/checkout/", method = RequestMethod.POST)
    public Object checkoutPostPage(Model model, HttpSession session,
            @RequestParam(name = "fullName") String fullName,
            @RequestParam(name = "email") String email,
            @RequestParam(name = "address") String address,
            @RequestParam(name = "phone") String phone) {
        
        OrderEntity order = (OrderEntity) session.getAttribute("order");
        
        Date date = new Date();
        order.setOrderDate(date);
        System.out.println("");
        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal() instanceof AccountEntity) {
            AccountEntity account = (AccountEntity) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            order.setUsername(account.getUsername());
        } else {
            order.setUsername("Unknow User");
        }
        
        order.setAddress(address);
        order.setFullName(fullName);
        order.setEmail(email);
        order.setPhone(phone);
        orderService.saveOrder(order);
        session.removeAttribute("order");
        return "redirect:/";
    }
}
