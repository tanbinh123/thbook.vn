/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.thbook.controller;

import com.mycompany.thbook.entities.CategoryEntity;
import com.mycompany.thbook.entities.ProductEntity;
import com.mycompany.thbook.service.AccountRoleService;
import com.mycompany.thbook.service.AccountService;
import com.mycompany.thbook.service.CategoryService;
import com.mycompany.thbook.service.ProductService;
import java.io.PrintWriter;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;
    
     @Autowired
    private JavaMailSenderImpl mailSender;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private AccountRoleService accountRoleService;

    @Autowired
    private AccountService accountService;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String homePage(Model model) {
        CategoryEntity mathCategory = categoryService.findCategoryByName("Sách Toán");
        List<ProductEntity> mathProduct = productService.findProductByCategoryPageableIndex(1, mathCategory);
        model.addAttribute("mathProduct", mathProduct);

        CategoryEntity physicalCategory = categoryService.findCategoryByName("Sách Lý");
        List<ProductEntity> physicalProduct = productService.findProductByCategoryPageableIndex(1, physicalCategory);
        model.addAttribute("physicalProduct", physicalProduct);

        CategoryEntity chemistryCategory = categoryService.findCategoryByName("Sách Hóa");
        List<ProductEntity> chemistryProduct = productService.findProductByCategoryPageableIndex(1, chemistryCategory);
        model.addAttribute("chemistryProduct", chemistryProduct);

        CategoryEntity literatureCategory = categoryService.findCategoryByName("Sách Ngữ Văn");
        List<ProductEntity> literatureProduct = productService.findProductByCategoryPageableIndex(1, literatureCategory);
        model.addAttribute("literatureProduct", literatureProduct);

        CategoryEntity englishCategory = categoryService.findCategoryByName("Sách Anh");
        List<ProductEntity> englishProduct = productService.findProductByCategoryPageableIndex(1, englishCategory);
        model.addAttribute("englishProduct", englishProduct);

        return "index";
    }

    @RequestMapping(value = {"/test"}, method = RequestMethod.GET)
    public String testPage(Model model,
            @RequestParam(value = "page", required = false) Integer page) {
          List<ProductEntity>  products = productService.getRecommendProduct();        
         
        return "test";
    }
    


    @RequestMapping(value = {"/bookdetail"}, method = RequestMethod.GET)
    public String homeBookDetail(Model model) {
        return "bookdetail";
    }

    @RequestMapping(value = {"/cart"}, method = RequestMethod.GET)
    public String cartPage(Model model) {
        return "cart";
    }

    @RequestMapping(value = "/category/{categoryName}/{pageCategory}", method = RequestMethod.GET)
    public Object categoryPage(Model model, @PathVariable(value = "categoryName") String categoryName,
            @PathVariable(value = "pageCategory") int pageCategory) {
        CategoryEntity categoryEntity = categoryService.findCategoryByName(categoryName);
        List<ProductEntity> products = productService.findProductByCategoryPageable(pageCategory, categoryEntity);
        model.addAttribute("products", products);
     
        return "category";
    }
  
     
     

    @RequestMapping(value = "/book/{bookId}", method = RequestMethod.GET)
    public Object bookPage(Model model, @PathVariable(value = "bookId") int bookId) {
        ProductEntity product = productService.getProductById(bookId); 
         List<ProductEntity>  products = productService.getRecommendProduct(); 
          List<ProductEntity>  products1 = productService.getRecommendProduct(); 
        model.addAttribute("product", product);  
        model.addAttribute("products",products);
        model.addAttribute("products1",products1);
        return "bookdetail";
    }
    

      @RequestMapping(value = "/search", method = RequestMethod.GET)
        public Object findByName(Model model,  @RequestParam(value = "keyword", required = false) String keyword) {
        List<ProductEntity> products = productService.getProductByname(keyword);
         model.addAttribute("products", products);    
         
        return "search";
    }
        
         @RequestMapping(value = "/message", method = RequestMethod.GET)
        public Object sendMail(Model model,  @RequestParam(value = "email", required = false) String email) {
         SimpleMailMessage message = new SimpleMailMessage();
         message.setTo("satthuomala27@gmail.com");
           message.setSubject("Register To Receive Information About New Books !");
          message.setText("This is an registered mail : " + email);
          this.mailSender.send(message);
          
        return "index";
    }
        
        
        
        

    
    
    

}
