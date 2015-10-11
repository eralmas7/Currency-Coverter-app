package com.currency.converter.repository;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import com.currency.converter.domain.Rate;

public class CurrencyRateRepository implements RateRepository {

    private final Map<String, BigDecimal> rateMap = new HashMap<String, BigDecimal>();

    @Override
    public BigDecimal getRate(final String sourceCurrency) {
        return rateMap.getOrDefault(sourceCurrency, BigDecimal.ONE);
    }

    @Override
    public void addAll(final Rate rate) {
        rateMap.putAll(rate.getRates());
    }
}
