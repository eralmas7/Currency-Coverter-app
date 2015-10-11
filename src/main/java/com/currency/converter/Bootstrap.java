package com.currency.converter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;

@SpringBootApplication
public class Bootstrap extends SpringBootServletInitializer {

    public static void main(final String[] inputArguments) {
        SpringApplication.run(Bootstrap.class, inputArguments);
    }

    @Override
    protected SpringApplicationBuilder configure(final SpringApplicationBuilder springApplicationBuilder) {
        return springApplicationBuilder.sources(Bootstrap.class);
    }
}
