package com.currency.converter.controller;

import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(final @RequestParam Optional<String> error) {
        LOGGER.debug("Getting user added page, error={}", error);
        return "redirect:/";
    }

    @RequestMapping("/failure")
    public String getHomePageAfterInvalidLogin(final ModelMap modelMap) {
        modelMap.addAttribute("error", "Invalid login");
        return "home";
    }
}
