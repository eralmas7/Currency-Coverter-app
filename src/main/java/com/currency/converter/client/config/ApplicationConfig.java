package com.currency.converter.client.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.client.RestTemplate;
import com.currency.converter.repository.RateRepository;
import com.currency.converter.repository.CurrencyRateRepository;

@Configuration
@EnableScheduling
class ApplicationConfig {

    @Bean
    public RestTemplate getRestTemplate() {
        final RestTemplate restTemplate = new RestTemplate();
        return restTemplate;
    }

    @Bean
    public RateRepository getRateRepository() {
        final RateRepository rateRepository = new CurrencyRateRepository();
        return rateRepository;
    }
}
