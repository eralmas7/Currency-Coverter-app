package com.currency.converter.service.currency;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import com.currency.converter.repository.RateRepository;

@Service
public class CurrencyRateFetcher {

    private RateFetcher rateFetcher;
    private RateRepository rateRepository;

    @Autowired
    public CurrencyRateFetcher(final @Qualifier("openExchangeRates") RateFetcher rateFetcher, final RateRepository rateRepository) {
        this.rateFetcher = rateFetcher;
        this.rateRepository = rateRepository;
    }

    @Scheduled(fixedDelayString = "${currency.convertor.latest.data.fetch.delay}")
    public void refreshRates() {
        rateRepository.addAll(rateFetcher.getRate());
    }
}
