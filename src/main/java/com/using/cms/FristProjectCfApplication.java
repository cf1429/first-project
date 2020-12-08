package com.using.cms;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.server.ConfigurableWebServerFactory;
import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpStatus;


@SpringBootApplication
@ComponentScan("com.using")
public class FristProjectCfApplication {

	public static ApplicationContext APPLICATION_CONTEXT;


	public static void main(String[] args) {
		APPLICATION_CONTEXT = SpringApplication.run(FristProjectCfApplication.class, args);

		System.err.println(APPLICATION_CONTEXT);
	}


	@Bean
	public WebServerFactoryCustomizer<ConfigurableWebServerFactory> webServerFactoryCustomizer() {
		return new WebServerFactoryCustomizer<ConfigurableWebServerFactory>() {
			@Override
			public void customize(ConfigurableWebServerFactory factory) {
				ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/index.html");
				factory.addErrorPages(error404Page);
			}

		};


	}


}
