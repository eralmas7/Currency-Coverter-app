package com.currency.converter.service.currentuser;

import com.currency.converter.domain.CurrentUser;

/**
 * User authorization service to perform authorization.
 */
public interface UserAuthorizationService {

    /**
     * Is user authorized to perform current operation?
     * 
     * @param currentUser
     * @param userId
     * @return
     */
    public boolean canAccessUser(final CurrentUser currentUser, final Long userId);
}
