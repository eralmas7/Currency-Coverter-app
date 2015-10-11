package com.currency.converter.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import com.currency.converter.domain.User;

/**
 * User detail repository to store user details.
 */
public interface UserRepository extends JpaRepository<User, Long> {

    /**
     * Given an email for the user, get the user details.
     * 
     * @param email
     * @return
     */
    public Optional<User> findOneByEmail(final String email);
}
