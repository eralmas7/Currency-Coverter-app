package com.currency.converter.repository;

import java.math.BigDecimal;
import com.currency.converter.domain.Rate;

/**
 * Repository to get all the rates or rate for a given source currency.
 */
public interface RateRepository {

    /**
     * Given a source currency return the foreign exchange rate.
     * 
     * @param sourceCurrency
     * @return
     */
    public BigDecimal getRate(final String sourceCurrency);

    /**
     * Given rate composed of list of rates, maintain them in cache.
     * 
     * @param rate
     */
    public void addAll(final Rate rate);
}
