package com.mycompany.thbook.ultil;

import com.mycompany.thbook.entities.AccountEntity;
import org.springframework.security.core.context.SecurityContextHolder;


public class AccountUltil {
    public static AccountEntity getAccount(){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof AccountEntity) {
            AccountEntity accountEntity = (AccountEntity) principal;
            return accountEntity;
        }   
        return null;
    }
}
