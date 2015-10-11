package com.currency.converter.domain;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

public class Rate {

    private Map<String, BigDecimal> rates;

    public Map<String, BigDecimal> getRates() {
        return new HashMap<String, BigDecimal>(rates);
    }

    public void setRates(final Map<String, BigDecimal> rates) {
        this.rates = new HashMap<String, BigDecimal>(rates);
    }
}
