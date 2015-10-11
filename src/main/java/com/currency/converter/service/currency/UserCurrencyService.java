package com.currency.converter.service.currency;

import java.util.List;
import com.currency.converter.domain.UserRequest;

/**
 * Currency service to serve client's currency queries.
 */
public interface UserCurrencyService {

    /**
     * Return last currency queries for user.
     * 
     * @param userId
     * @param countOfRecords
     * @return
     */
    public List<UserRequest> getUserRequestById(final Long userId, final int countOfRecords);

    /**
     * Create a currency request for audit information.
     * 
     * @param userRequestForm
     * @return
     */
    public UserRequest create(final UserRequest userRequestForm);
}
