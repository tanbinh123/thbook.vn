package com.mycompany.thbook.repository;

import com.mycompany.thbook.entities.CategoryEntity;
import com.mycompany.thbook.entities.ProductEntity;
import com.mycompany.thbook.entities.enums.ActiveStatus;
import java.util.List;
import org.hibernate.Session;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends PagingAndSortingRepository<ProductEntity, Integer> {

    ProductEntity findById(int id);
    

    @Query(value = "select p from ProductEntity p where p.category.id = :categoryID and p.status = :status")
    Page<ProductEntity> findProductByCategoryID(@Param("categoryID") int categoryID, @Param("status") ActiveStatus status, Pageable pageable);

    @Query(value = "select p from ProductEntity p where p.status = :status")
    List<ProductEntity> findAllActiveProduct(@Param("status") ActiveStatus status);
     
    @Query(value = "select p from ProductEntity p where p.category = :category and p.status = :status")
    List<ProductEntity> findProductByCategoryPageable(@Param("category") CategoryEntity category, @Param("status") ActiveStatus status, Pageable pageable);

   @Query(value ="SELECT p FROM ProductEntity p WHERE p.name LIKE CONCAT('%',:name,'%')")
    List<ProductEntity> findByname(@Param("name") String name);
    
    @Query(value = "SELECT * FROM thbook.product ORDER BY RAND() LIMIT 4",nativeQuery = true)
    List<ProductEntity> findRecommendProduct();
     
}
