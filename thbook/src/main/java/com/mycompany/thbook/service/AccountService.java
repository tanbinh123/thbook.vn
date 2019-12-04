package com.mycompany.thbook.service;

import com.mycompany.thbook.entities.AccountEntity;
import com.mycompany.thbook.repository.AccountRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;
    
    public AccountEntity findAccountByUsernameAndPassword(String username, String password) {
        return accountRepository.findByUsernameLikeAndPasswordLike(username, password);
    }

    public List<AccountEntity> getAccounts() {
        return (List<AccountEntity>) accountRepository.findAll();
    }

    public Page<AccountEntity> getAccounts(int page) {
        Pageable pageable = new PageRequest(page - 1, 9);
        return (Page<AccountEntity>) accountRepository.findAll(pageable);
    }

    public Page<AccountEntity> searchAccounts(String searchText, int page) {
        Pageable pageable = new PageRequest(page - 1, 9);
        return accountRepository.findAccountByAny(searchText, pageable);
    }

    public AccountEntity getAccountById(int id) {
        return accountRepository.findById(id);
    }

    public AccountEntity saveAccount(AccountEntity account) {
        return (AccountEntity) accountRepository.save(account);
    }

    public void deleteAccountById(int id) {
        accountRepository.delete(accountRepository.findById(id));
    }

    public AccountEntity getAccountByEmail(String email) {
        return accountRepository.findByEmail(email);
    }

    public AccountEntity getAccountByUsername(String username) {
        return accountRepository.findByUsername(username);
    }
}
