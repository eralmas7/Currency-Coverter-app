package com.currency.converter.controller;

import java.util.ArrayList;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.currency.converter.domain.CurrentUser;
import com.currency.converter.service.currency.UserCurrencyService;

@Controller
public class LoginController {

    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
    private static final int maxHistoryRecordCount = Integer.parseInt(System.getProperty("currency.convertor.history.max.records.count", "10"), 10);
    private UserCurrencyService userCurrencyService;

    @Autowired
    public LoginController(final UserCurrencyService userCurrencyService) {
        this.userCurrencyService = userCurrencyService;
    }

    @RequestMapping(value = "/userAdded", method = RequestMethod.GET)
    public ModelAndView getUserAddPage(final @RequestParam Optional<String> error) {
        LOGGER.debug("Getting user added page, error={}", error);
        return new ModelAndView("userAdded", "error", error);
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(final @RequestParam Optional<String> error) {
        LOGGER.debug("Getting user added page, error={}", error);
        return "redirect:/";
    }

    @RequestMapping(value = "/currencyAdded", method = RequestMethod.GET)
    public ModelAndView getCurrencyAddPage(final @RequestParam Optional<String> error) {
        final CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return new ModelAndView("currencyHistory", "error", Optional.ofNullable(userCurrencyService.getUserRequestById(principal.getId(), maxHistoryRecordCount)).orElse(new ArrayList<>()));
    }
}
