package com.mycompany.thbook.repository;

import com.mycompany.thbook.entities.OrderEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends PagingAndSortingRepository<OrderEntity, Integer> {

    OrderEntity findById(int id);

    @Query(value = "select o from OrderEntity o where o.id = ?1")
    OrderEntity findOrderByIdAndEmail(int id, String email);
    
     @Query(value = "select o from OrderEntity o where o.username = ?1")
     List<OrderEntity> findProductByUserName(String username);
     
     
     @Query(value ="SELECT o FROM OrderEntity o WHERE o.username LIKE CONCAT('%','ctv','%')")
     List<OrderEntity> getOrdersByCtv();


    @Query(value = "select o from OrderEntity o where o.orderDate = ?1")
    Page<OrderEntity> findOrderByDate(Date orderDate, Pageable pageable);
    
}
