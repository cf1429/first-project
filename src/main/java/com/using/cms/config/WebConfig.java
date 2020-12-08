package com.using.cms.config;

import com.using.cms.filter.CORSFilter;
import com.using.cms.filter.LoginFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class WebConfig {

	@Bean
	public FilterRegistrationBean corsFilter() {
		CORSFilter corsFilter = new CORSFilter();

		FilterRegistrationBean registration = new FilterRegistrationBean();
		registration.setFilter(corsFilter);
		registration.setName("CORSFilter");
		registration.addUrlPatterns("/*");
		registration.setOrder(1);
		return registration;
	}

	@Bean
	@Autowired
	public FilterRegistrationBean loginFilter(AuthConfig authConfig) {
		LoginFilter loginFilter = new LoginFilter();
		loginFilter.setAuthConfig(authConfig);

		FilterRegistrationBean registration = new FilterRegistrationBean();
		registration.setFilter(loginFilter);
		registration.setName("LoginFilter");
		registration.addUrlPatterns("/*");
		registration.setOrder(2);
		return registration;
	}
}
