package com.currency.converter;

import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@AcceptanceTest
public class ExecuteJbehaveStory extends AbstractSpringJBehaveStory {

    public ExecuteJbehaveStory() {
        System.setProperty("currency.convertor.history.max.records.count", "10");
        System.setProperty("currency.convertor.data.source.url", "https://openexchangerates.org/api/latest.json?app_id=b32c839bea53430696f759d6ee8d8dbf");
        System.setProperty("currency.convertor.latest.data.fetch.delay", "3600000");
        System.setProperty("spring.freemarker.template-loader-path", "/WEB-INF/ftl");
        System.setProperty("spring.freemarker.expose-request-attributes", "true");
        System.setProperty("spring.freemarker.expose-spring-macro-helpers", "true");
        System.setProperty("spring.data.jpa.repositories.enabled", "true");
    }
}
