package com.mycompany.thbook.repository;

import com.mycompany.thbook.entities.AccountRoleEntity;
import com.mycompany.thbook.entities.enums.Role;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface AccountRoleRepository extends PagingAndSortingRepository<AccountRoleEntity, Integer>{
    AccountRoleEntity findByRoles(Role roles);
}
