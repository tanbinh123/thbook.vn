package com.mycompany.thbook.security;

import com.mycompany.thbook.entities.AccountEntity;
import com.mycompany.thbook.entities.AccountRoleEntity;
import com.mycompany.thbook.service.AccountService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private AccountService accountService;

    @Override
    public Authentication authenticate(Authentication a) throws AuthenticationException {
        String username = a.getName();
        String password = a.getCredentials().toString();
        if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
            AccountEntity acc = accountService.findAccountByUsernameAndPassword(username, password);
            if (acc != null && acc.getId() > 0) {
                List<GrantedAuthority> authoritys = new ArrayList<>();
                for (AccountRoleEntity accountRole : acc.getAccountRoles()) {
                    authoritys.add(new SimpleGrantedAuthority(accountRole.getRoles().toString().trim()));
                }
                return new UsernamePasswordAuthenticationToken(acc, username, authoritys);
            } else {
                throw new BadCredentialsException("Username or password incorrect.");
            }
        } else {
            throw new BadCredentialsException("Username or password is empty");
        }
    }

    @Override
    public boolean supports(Class<?> type) {
        return type.equals(UsernamePasswordAuthenticationToken.class);
    }

}
