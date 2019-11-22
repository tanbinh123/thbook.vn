package com.mycompany.thbook.controller;

import com.mycompany.thbook.entities.AccountEntity;
import com.mycompany.thbook.entities.AccountRoleEntity;
import com.mycompany.thbook.entities.enums.Role;
import com.mycompany.thbook.service.AccountRoleService;
import com.mycompany.thbook.service.AccountService;
import com.mycompany.thbook.service.OrderService;
import com.mycompany.thbook.service.ProductService;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private AccountRoleService accountRoleService;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String loginPage(Model model) {
        return "login";
    }

    @RequestMapping(value = {"/register"}, method = RequestMethod.GET)
    public String registerGetPage(Model model) {
        return "register";
    }

    @RequestMapping(value = {"/register"}, method = RequestMethod.POST)
    public String registerAccount(Model model, @ModelAttribute(value = "account") AccountEntity account, @ModelAttribute(value = "password1") String password1, @ModelAttribute(value = "password2") String password2) {
        if (account.getFullName().isEmpty()) {
            model.addAttribute("messageError", "Fullname must be filled out");
            return "register";
        }
        if (account.getEmail().isEmpty()) {
            model.addAttribute("messageError", "Email must be filled out");
            return "register";
        }
        if (account.getAddress().isEmpty()) {
            model.addAttribute("messageError", "Address must be filled out");
            return "register";
        }
        if (account.getPhone().isEmpty()) {
            model.addAttribute("messageError", "Telephone number must be filled out");
            return "register";
        }
        if (!Pattern.matches("^[a-zA-Z0-9_]+$", account.getUsername())) {
            model.addAttribute("messageError", "The username contains illegal characters.");
            return "register";
        }
        if (password1.length() < 5) {
            model.addAttribute("messageError", "Password must be greater than or equal to 5 characters");
            return "register";
        }
        if (!password1.equals(password2)) {
            model.addAttribute("messageError", "Password is not the same, please check again");
            return "register";
        }
        AccountEntity checkUsername = accountService.getAccountByUsername(account.getUsername());
        if (checkUsername != null) {
            model.addAttribute("messageError", "This username already exists");
            return "register";
        }
        AccountEntity checkEmail = accountService.getAccountByEmail(account.getEmail());
        if (checkEmail != null) {
            model.addAttribute("messageError", "This email address already exists");
            return "register";
        }
        account.setPassword(password2);
        List<AccountRoleEntity> accountRoleEntitys = new ArrayList<>();
        accountRoleEntitys.add(accountRoleService.getAccountRolesByRole(Role.ROLE_USER));
        account.setAccountRoles(accountRoleEntitys);
        AccountEntity accountSaved = accountService.saveAccount(account);
        return "login";
    }

}
