package com.currency.converter.repository;

import java.util.List;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.currency.converter.domain.UserRequest;

/**
 * User query storage repository.
 */
public interface UserCurrencyRepository extends JpaRepository<UserRequest, Long> {

    /**
     * Given a user id get a list of user requests for currency conversion.
     * 
     * @param pageable
     * @param userId
     * @return
     */
    @Query("FROM UserRequest u WHERE u.user.id = :id")
    public List<UserRequest> findAllRequest(final Pageable pageable, final @Param("id") Long userId);
}
