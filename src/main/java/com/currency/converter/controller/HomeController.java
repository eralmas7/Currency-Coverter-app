package com.currency.converter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String getHomePage() {
        return "home";
    }

    @RequestMapping("/failure")
    public String getHomePageAfterInvalidLogin(final ModelMap modelMap) {
        modelMap.addAttribute("error", "Invalid login");
        return "home";
    }
}
