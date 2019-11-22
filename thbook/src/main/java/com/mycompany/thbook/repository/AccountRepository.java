package com.mycompany.thbook.repository;

import com.mycompany.thbook.entities.AccountEntity;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface AccountRepository extends PagingAndSortingRepository<AccountEntity, Integer>{
    AccountEntity findByUsernameLikeAndPasswordLike(String username, String password);
    
    @Query(value = "select a from AccountEntity a where a.username = :searchText or a.fullName like %:searchText% or a.email = :searchText or a.phone = :searchText or a.address like %:searchText%")
    Page<AccountEntity> findAccountByAny(@Param("searchText") String searchText, Pageable pageable);
    
    AccountEntity findById(Integer id);
    
    AccountEntity findByEmail(String email);
    
    AccountEntity findByUsername(String username);
    
}
