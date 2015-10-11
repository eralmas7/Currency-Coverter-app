package com.currency.converter.service.currency;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import com.currency.converter.domain.Rate;

@Component
@Qualifier("openExchangeRates")
public class OpenExchangeRates implements RateFetcher {

    private RestTemplate restTemplate;
    private String currencyDataFetchUrl;

    @Autowired
    public OpenExchangeRates(final RestTemplate restTemplate, final @Value("${currency.convertor.data.source.url}") String currencyDataFetchUrl) {
        this.restTemplate = restTemplate;
        this.currencyDataFetchUrl = currencyDataFetchUrl;
    }

    @Override
    public Rate getRate() {
        final ResponseEntity<Rate> rateEntity = restTemplate.getForEntity(currencyDataFetchUrl, Rate.class);
        return rateEntity.getBody();
    }
}
