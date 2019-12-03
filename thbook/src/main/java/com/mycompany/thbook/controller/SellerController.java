package com.mycompany.thbook.controller;

import com.mycompany.thbook.entities.OrderEntity;
import com.mycompany.thbook.entities.ProductEntity;
import com.mycompany.thbook.entities.enums.OrderStatus;
import com.mycompany.thbook.service.AccountService;
import com.mycompany.thbook.service.CategoryService;
import com.mycompany.thbook.service.OrderService;
import com.mycompany.thbook.service.ProductService;
import com.mycompany.thbook.ultil.AccountUltil;
import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SellerController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = {"/seller", "/seller/dashboard"}, method = RequestMethod.GET)
    public String dashboardPage(Model model) {
        List<ProductEntity> products = productService.getPorducts();
        model.addAttribute("products", products);
        return "seller/product-manager";
    }

    @RequestMapping(value = {"/seller/order-manager"}, method = RequestMethod.GET)
    public String orderManagerPage(Model model) {
        String username =  AccountUltil.getAccount().getUsername();
        List<OrderEntity> orders = orderService.getOrdersByUserName(username);
        List<OrderStatus> orderStatus = Arrays.asList(OrderStatus.values());
        model.addAttribute("orderStatus", orderStatus);
        model.addAttribute("orders", orders);
        return "seller/order-manager";
    }

    

    @RequestMapping(value = {"/seller/product-manager"}, method = RequestMethod.GET)
    public String productManagerPage(Model model) {
        List<ProductEntity> products = productService.getPorducts();
        model.addAttribute("products", products);
        return "seller/product-manager";
    }

}
