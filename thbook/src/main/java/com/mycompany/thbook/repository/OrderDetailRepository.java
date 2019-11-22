package com.mycompany.thbook.repository;

import com.mycompany.thbook.entities.OrderDetailEntity;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailRepository extends PagingAndSortingRepository<OrderDetailEntity, Integer> {
}
