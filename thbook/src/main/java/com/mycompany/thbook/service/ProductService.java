package com.mycompany.thbook.service;

import com.mycompany.thbook.entities.CategoryEntity;
import com.mycompany.thbook.repository.*;
import com.mycompany.thbook.entities.ProductEntity;
import com.mycompany.thbook.entities.enums.ActiveStatus;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public Page<ProductEntity> getPorducts(int page) {
        Pageable pageable = new PageRequest(page - 1, 9);
        return (Page<ProductEntity>) productRepository.findAll(pageable);
    }
     
     public List<ProductEntity> getRecommendProduct(){
         return (List<ProductEntity>) productRepository.findRecommendProduct();
     }

    public List<ProductEntity> getPorducts() {
        return (List<ProductEntity>) productRepository.findAll();
    }

    public List<ProductEntity> getProductsActive() {
        return productRepository.findAllActiveProduct(ActiveStatus.ACTIVE);
    }

    public ProductEntity saveProduct(ProductEntity product) {
        return productRepository.save(product);
    }

    public ProductEntity getProductById(int id) {
        return productRepository.findById(id);
    }
      public List<ProductEntity> getProductByname(String name) {
        return productRepository.findByname(name);
    }
      
    public List<ProductEntity> findProductByCategoryPageable(int page, CategoryEntity category) {
        Pageable pageable = new PageRequest(page - 1, 12);
        return productRepository.findProductByCategoryPageable(category, ActiveStatus.ACTIVE, pageable);
    }

    public List<ProductEntity> findProductByCategoryPageableIndex(int page, CategoryEntity category) {
        Pageable pageable = new PageRequest(page - 1, 4);
        return productRepository.findProductByCategoryPageable(category, ActiveStatus.ACTIVE, pageable);
    }

    public void deletProductById(int id) {
        productRepository.delete(productRepository.findById(id));
    }
    
   
}
