package com.mycompany.thbook.controller;

import com.mycompany.thbook.entities.AccountEntity;
import com.mycompany.thbook.entities.AccountRoleEntity;
import com.mycompany.thbook.entities.CategoryEntity;
import com.mycompany.thbook.entities.OrderEntity;
import com.mycompany.thbook.entities.ProductEntity;
import com.mycompany.thbook.entities.enums.OrderStatus;
import com.mycompany.thbook.entities.enums.Role;
import com.mycompany.thbook.service.AccountService;
import com.mycompany.thbook.service.CategoryService;
import com.mycompany.thbook.service.OrderService;
import com.mycompany.thbook.service.ProductService;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = {"/admin", "/admin/dashboard"}, method = RequestMethod.GET)
    public String dashboardPage(Model model) {
        return "admin/dashboard";
    }

    @RequestMapping(value = {"/admin/account-manager"}, method = RequestMethod.GET)
    public String accountManagerPage(Model model) {
        List<AccountEntity> accounts = accountService.getAccounts();
        List<Role> roles = Arrays.asList(Role.values());
        model.addAttribute("roles", roles);
        model.addAttribute("accounts", accounts);
        return "admin/account-manager";
    }

    @RequestMapping(value = {"/admin/updateAccount"}, method = RequestMethod.POST)
    public String updateAccount(Model model, @RequestParam(value = "id") int id,
            @RequestParam(value = "role") Role role) {
        System.out.println(id);
        AccountEntity account = accountService.getAccountById(id);

        List<AccountRoleEntity> accountRoles = new ArrayList();
        AccountRoleEntity accountRole = new AccountRoleEntity();

        accountRole.setRoles(role);
        accountRoles.add(accountRole);
        account.setAccountRoles(accountRoles);

        accountService.saveAccount(account);
        
        
        List<Role> roles = Arrays.asList(Role.values());
        model.addAttribute("roles", roles);

        List<AccountEntity> accounts = accountService.getAccounts();
        model.addAttribute("accounts", accounts);
        return "admin/account-manager";
    }

    @RequestMapping(value = {"/admin/delete"}, method = RequestMethod.POST)
    public String deleteAccount(Model model, @RequestParam(value = "id") int id) {
        accountService.deleteAccountById(id);
        List<AccountEntity> accounts = accountService.getAccounts();
        model.addAttribute("accounts", accounts);
        return "admin/account-manager";
    }

    @RequestMapping(value = {"/admin/order-manager"}, method = RequestMethod.GET)
    public String orderManagerPage(Model model) {
        List<OrderEntity> orders = orderService.getOrders();
        List<OrderStatus> orderStatus = Arrays.asList(OrderStatus.values());
        model.addAttribute("orderStatus", orderStatus);
        model.addAttribute("orders", orders);
        return "admin/order-manager";
    }

    @RequestMapping(value = {"/admin/deleteOrder"}, method = RequestMethod.POST)
    public String deleteOrder(Model model, @RequestParam(value = "id") int id) {
        orderService.deleteOrderById(id);
        List<OrderEntity> orders = orderService.getOrders();
        model.addAttribute("orders", orders);
        return "admin/order-manager";
    }

    @RequestMapping(value = {"/admin/updateOrder"}, method = RequestMethod.POST)
    public String updateOrder(Model model, @RequestParam(value = "id") int id,
            @RequestParam(value = "status") OrderStatus status) {
        OrderEntity order = orderService.getOrderById(id);
        order.setStatus(status);
        orderService.saveOrder(order);
        List<OrderEntity> orders = orderService.getOrders();
        List<OrderStatus> orderStatus = Arrays.asList(OrderStatus.values());
        model.addAttribute("orderStatus", orderStatus);
        model.addAttribute("orders", orders);
        return "admin/order-manager";
    }

    @RequestMapping(value = {"/admin/product-manager"}, method = RequestMethod.GET)
    public String productManagerPage(Model model) {
        List<ProductEntity> products = productService.getPorducts();
        model.addAttribute("products", products);
        return "admin/product-manager";
    }

    @RequestMapping(value = {"/admin/deleteProduct"}, method = RequestMethod.POST)
    public String deleteProduct(Model model, @RequestParam(value = "id") int id) {
        productService.deletProductById(id);
        List<ProductEntity> products = productService.getPorducts();
        model.addAttribute("products", products);
        return "admin/product-manager";
    }

    @RequestMapping(value = {"/admin/add-product"}, method = RequestMethod.POST)
    public String addProduct(Model model, @ModelAttribute(value = "product") ProductEntity product,
            @RequestParam(value = "categoryName") int categoryId) {
        product.setCategory(categoryService.getCategoryById(categoryId));
        System.out.println(product.getCategory().getId());
        productService.saveProduct(product);
        return "admin/product-manager";
    }

    @RequestMapping(value = {"/admin/add-product"}, method = RequestMethod.GET)
    public String addProduct(Model model) {
        model.addAttribute("categorys", categoryService.getCategorys());
        return "admin/add-product";
    }
}
