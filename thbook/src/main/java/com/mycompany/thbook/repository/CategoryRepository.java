package com.mycompany.thbook.repository;

import com.mycompany.thbook.entities.CategoryEntity;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends PagingAndSortingRepository<CategoryEntity, Integer> {

    CategoryEntity findById(int id);

    public CategoryEntity findCategoryByName(String name);
}
