package com.currency.converter.controller;

import java.util.NoSuchElementException;
import javax.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.currency.converter.domain.User;
import com.currency.converter.service.user.UserService;

@Controller
public class UserController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @PreAuthorize("@currentUserServiceImpl.canAccessUser(principal, #userId)")
    @RequestMapping("/user/{userId}")
    public ModelAndView getUserPage(final @PathVariable Long userId) {
        LOGGER.debug("Getting user page for user={}", userId);
        return new ModelAndView("user", "user", userService.getUserById(userId).orElseThrow(() -> new NoSuchElementException(String.format("User=%s not found", userId))));
    }

    @RequestMapping(value = "/user/create", method = RequestMethod.GET)
    public ModelAndView getUserCreatePage() {
        LOGGER.debug("Getting user create form");
        return new ModelAndView("user_create", "form", new User());
    }

    @RequestMapping(value = "/user/create", method = RequestMethod.POST)
    public String handleUserCreateForm(final @Valid @ModelAttribute("form") User userForm, final BindingResult bindingResult) {
        LOGGER.debug("Processing user create form={}, bindingResult={}", userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "user_create";
        }
        try {
            userService.create(userForm);
        } catch (DataIntegrityViolationException e) {
            LOGGER.warn("Exception occurred when trying to save the user, assuming duplicate email", e);
            bindingResult.reject("email.exists", "Email already exists");
            return "user_create";
        }
        return "redirect:/userAdded";
    }
}
