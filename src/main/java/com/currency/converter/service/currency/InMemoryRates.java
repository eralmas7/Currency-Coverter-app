package com.currency.converter.service.currency;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import com.currency.converter.domain.Rate;

@Component
@Qualifier("inMemoryRates")
public class InMemoryRates implements RateFetcher {

    public Rate getRate() {
        final Map<String, BigDecimal> rates = new HashMap<String, BigDecimal>();
        final Rate rate = new Rate();
        rate.setRates(rates);
        rates.put("USD", BigDecimal.ONE);
        rates.put("EUR", BigDecimal.TEN);
        return rate;
    }
}
