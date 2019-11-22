package com.mycompany.thbook.service;

import com.mycompany.thbook.repository.*;
import com.mycompany.thbook.entities.AccountRoleEntity;
import com.mycompany.thbook.entities.enums.Role;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

@Service
public class AccountRoleService {

    @Autowired
    private AccountRoleRepository accountRoleRepository;

    public List<AccountRoleEntity> getAccountRoles() {
        return (List<AccountRoleEntity>) accountRoleRepository.findAll();
    }

    public AccountRoleEntity getAccountRolesByRole(Role role) {
        return accountRoleRepository.findByRoles(role);
    }
}
