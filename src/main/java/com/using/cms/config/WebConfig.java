package com.using.cms.config;

//@Configuration
//public class WebConfig {
//
//	@Bean
//	public FilterRegistrationBean corsFilter() {
//		CORSFilter corsFilter = new CORSFilter();
//
//		FilterRegistrationBean registration = new FilterRegistrationBean();
//		registration.setFilter(corsFilter);
//		registration.setName("CORSFilter");
//		registration.addUrlPatterns("/*");
//		registration.setOrder(1);
//		return registration;
//	}
//
//	@Bean
//	@Autowired
//	public FilterRegistrationBean loginFilter(AuthConfig authConfig) {
//		LoginFilter loginFilter = new LoginFilter();
//		loginFilter.setAuthConfig(authConfig);
//
//		FilterRegistrationBean registration = new FilterRegistrationBean();
//		registration.setFilter(loginFilter);
//		registration.setName("LoginFilter");
//		registration.addUrlPatterns("/*");
//		registration.setOrder(2);
//		return registration;
//	}
//}
