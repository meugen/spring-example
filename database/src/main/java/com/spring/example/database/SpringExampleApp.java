package com.spring.example.database;

import com.spring.example.database.config.AppConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Import;

@SpringBootConfiguration
@Import(AppConfig.class)
public class SpringExampleApp {

    public static void main(String[] args) {
        SpringApplication.run(SpringExampleApp.class, args);
    }
}
