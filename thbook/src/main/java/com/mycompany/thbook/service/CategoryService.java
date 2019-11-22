package com.mycompany.thbook.service;

import com.mycompany.thbook.repository.*;
import com.mycompany.thbook.entities.CategoryEntity;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public CategoryEntity getCategoryById(int id) {
        return categoryRepository.findById(id);
    }

    public List<CategoryEntity> getCategorys() {
        return (List<CategoryEntity>) categoryRepository.findAll();
    }

    public CategoryEntity findCategoryByName(String name) {
        return categoryRepository.findCategoryByName(name);
    }
}
