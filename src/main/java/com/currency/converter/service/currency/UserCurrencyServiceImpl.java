package com.currency.converter.service.currency;

import java.math.BigDecimal;
import java.math.MathContext;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import com.currency.converter.domain.UserRequest;
import com.currency.converter.repository.RateRepository;
import com.currency.converter.repository.UserCurrencyRepository;

@Service
public class UserCurrencyServiceImpl implements UserCurrencyService {

    private final UserCurrencyRepository userCurrencyRepository;
    private final RateRepository rateRepository;

    @Autowired
    public UserCurrencyServiceImpl(UserCurrencyRepository userCurrencyRepository, final RateRepository rateRepository) {
        this.userCurrencyRepository = userCurrencyRepository;
        this.rateRepository = rateRepository;
    }

    @Override
    public List<UserRequest> getUserRequestById(Long id, int size) {
        return userCurrencyRepository.findAllRequest(new PageRequest(0, size, Direction.DESC, "createdAt"), id);
    }

    @Override
    public UserRequest create(UserRequest form) {
        long quantity = form.getQuantity();
        String source = form.getSource();
        String destination = form.getDestination();
        form.setAmount(rateRepository.getRate(destination.toUpperCase()).divide(rateRepository.getRate(source.toUpperCase()), MathContext.DECIMAL32).multiply(new BigDecimal(quantity, MathContext.DECIMAL32)));
        return userCurrencyRepository.save(form);
    }
}
