package com.currency.converter.service.user;

import java.util.Collection;
import java.util.Optional;
import com.currency.converter.domain.User;

/**
 * Service to serve queries based on user details.
 */
public interface UserService {

    /**
     * Get the user based on user id.
     * 
     * @param userId
     * @return
     */
    public Optional<User> getUserById(final long userId);

    /**
     * Get the user by email.
     * 
     * @param email
     * @return
     */
    public Optional<User> getUserByEmail(final String email);

    /**
     * Get all the users who have registered.
     * 
     * @return
     */
    public Collection<User> getAllUsers();

    /**
     * Create new user.
     * 
     * @param userForm
     * @return
     */
    public User create(final User userForm);
}
