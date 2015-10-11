package com.currency.converter.jbehave;

import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.junit.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import com.currency.converter.domain.UserRequest;
import com.currency.converter.service.currency.UserCurrencyService;

@Steps
public class CurrencyConversionSteps {

    @Autowired
    private UserCurrencyService userCurrencyService;
    private UserRequest userRequest;

    @Given("a user desires to convert currency")
    public void getNewUser() {
        userRequest = new UserRequest();
    }

    @When("client tries to convert the currency from EUR to USD with quantity as 100")
    public void registerUser(String source, String destination, long quantity) {
        userRequest.setSource(source);
        userRequest.setDestination(destination);
        userRequest.setQuantity(quantity);
    }

    @Then("user should be allowed to convert the currency")
    public void userExists() {
        UserRequest userRequest = userCurrencyService.create(this.userRequest);
        Assert.assertTrue(userRequest.getAmount() != null);
        Assert.assertEquals(userRequest.getSource(), this.userRequest.getSource());
        Assert.assertEquals(userRequest.getDestination(), this.userRequest.getDestination());
    }
}
