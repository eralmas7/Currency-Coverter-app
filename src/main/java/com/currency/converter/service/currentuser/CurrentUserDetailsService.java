package com.currency.converter.service.currentuser;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.currency.converter.domain.CurrentUser;
import com.currency.converter.domain.User;
import com.currency.converter.service.user.UserService;

@Service
public class CurrentUserDetailsService implements UserDetailsService {

    private final UserService userService;

    @Autowired
    public CurrentUserDetailsService(final UserService userService) {
        this.userService = userService;
    }

    @Override
    public CurrentUser loadUserByUsername(final String email) throws UsernameNotFoundException {
        final User user = userService.getUserByEmail(email).orElseThrow(() -> new UsernameNotFoundException(String.format("User with email=%s was not found", email)));
        return new CurrentUser(user);
    }
}
