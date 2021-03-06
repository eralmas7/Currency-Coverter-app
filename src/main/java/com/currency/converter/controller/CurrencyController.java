package com.currency.converter.controller;

import java.util.ArrayList;
import java.util.Optional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.currency.converter.domain.CurrentUser;
import com.currency.converter.domain.UserRequest;
import com.currency.converter.service.currency.UserCurrencyService;

@Controller
public class CurrencyController {

    private UserCurrencyService userCurrencyService;
    private static final int maxHistoryRecordCount = Integer.parseInt(System.getProperty("currency.convertor.history.max.records.count", "10"), 10);

    @Autowired
    public CurrencyController(final UserCurrencyService userCurrencyService) {
        this.userCurrencyService = userCurrencyService;
    }

    @PreAuthorize("@currentUserServiceImpl.canAccessUser(principal, #userId)")
    @RequestMapping("/currency/history/{userId}")
    public ModelAndView getUserHistory(final @PathVariable Long userId) {
        return new ModelAndView("currencyHistory", "userRequests", Optional.ofNullable(userCurrencyService.getUserRequestById(userId, maxHistoryRecordCount)).orElse(new ArrayList<>()));
    }

    @PreAuthorize("@currentUserServiceImpl.canAccessUser(principal, #userId)")
    @RequestMapping("/currency/converter/{userId}")
    public ModelAndView getConertedCurrency(final @PathVariable Long userId) {
        return new ModelAndView("currencyForm", "form", new UserRequest());
    }

    @PreAuthorize("@currentUserServiceImpl.canAccessUser(principal, #userId)")
    @RequestMapping(value = "/currency/converter/{userId}", method = RequestMethod.POST)
    public String handleUserCreateForm(final @Valid @ModelAttribute("currencyForm") UserRequest userRequestForm, final @PathVariable Long userId, final BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "currencyForm";
        }
        try {
            userCurrencyService.create(userRequestForm);
        } catch (DataIntegrityViolationException e) {
            return "currencyForm";
        }
        return "redirect:/currency/history/" + userId;
    }

    @RequestMapping(value = "/currencyAdded", method = RequestMethod.GET)
    public ModelAndView getCurrencyAddPage(final @RequestParam Optional<String> error) {
        final CurrentUser principal = (CurrentUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return new ModelAndView("currencyHistory", "error", Optional.ofNullable(userCurrencyService.getUserRequestById(principal.getId(), maxHistoryRecordCount)).orElse(new ArrayList<>()));
    }
}
