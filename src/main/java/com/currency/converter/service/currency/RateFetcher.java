package com.currency.converter.service.currency;

import com.currency.converter.domain.Rate;

/**
 * Fetcher to fetch rate from either in memory or from external exchanges.
 */
public interface RateFetcher {

    /**
     * Returns the rates.
     * 
     * @return
     */
    public Rate getRate();
}
