package com.currency.converter;

import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.junit.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import com.currency.converter.domain.User;
import com.currency.converter.service.user.UserService;

@Steps
public class NewUserSteps {

    @Autowired
    private UserService userService;
    private User user;

    @Given("a new user with email $email password $password")
    public void getNewUser(String email, String password) {
        user = new User();
        user.setEmail(email);
        user.setPassword(password);
    }

    @When("client tries to register the user")
    public void registerUser() {
        userService.create(this.user);
    }

    @Then("user with email $email exists")
    public void userExists(String email) {
        Assert.assertTrue(userService.getUserByEmail(email).isPresent());
    }
}
