package com.currency.converter;

import static org.hamcrest.Matchers.hasProperty;
import static org.hamcrest.Matchers.nullValue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import java.util.ArrayList;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.boot.test.SpringApplicationContextLoader;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import com.currency.converter.controller.CurrencyController;
import com.currency.converter.domain.UserRequest;
import com.currency.converter.service.currency.UserCurrencyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(loader = SpringApplicationContextLoader.class, classes = {Bootstrap.class})
@TestExecutionListeners({DependencyInjectionTestExecutionListener.class, DirtiesContextTestExecutionListener.class, TransactionalTestExecutionListener.class})
public class CurrencyControllerTest {

    private MockMvc mockMvc;
    @InjectMocks
    private CurrencyController currencyController;
    @Mock
    private UserCurrencyService userCurrencyService;

    @Before
    public void setup() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(currencyController).build();
    }

    @Test
    public void showAddCurrencyForm() throws Exception {
        mockMvc.perform(get("/currency/converter/{userId}", 1)).andExpect(status().isOk()).andExpect(view().name("currencyForm")).andExpect(model().attribute("form", hasProperty("source", nullValue()))).andExpect(model().attribute("destination", nullValue())).andExpect(
                        model().attribute("quantity", nullValue()));
    }

    @Test
    public void submitAddCurrencyForm() throws Exception {
        mockMvc.perform(post("/currency/converter/{userId}", 1).param("source", "INR").param("destination", "EUR").param("quantity", "10")).andExpect(status().is3xxRedirection()).andExpect(view().name("redirect:/currency/history/1"));
    }

    @Test
    public void submitAddCurrencyFormMissingData() throws Exception {
        mockMvc.perform(post("/currency/converter/{userId}", 1)).andExpect(status().is4xxClientError());
    }

    @Test
    public void showUserCurrencyHistory() throws Exception {
        mockMvc.perform(get("/currency/history/{userId}", 1)).andExpect(status().isOk()).andExpect(view().name("currencyHistory")).andExpect(model().attribute("userRequests", new ArrayList<UserRequest>()));
    }
}
