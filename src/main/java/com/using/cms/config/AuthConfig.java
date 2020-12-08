package com.using.cms.config;

import org.apache.commons.lang3.StringUtils;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "using.system.auth")
public class AuthConfig {
	protected String loginUrl;
	protected String[] excludeUrl;

	public AuthConfig() {

	}

	public String getLoginUrl() {
		return loginUrl;
	}

	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}

	public String[] getExcludeUrl() {
		return excludeUrl;
	}

	public void setExcludeUrl(String excludeUrl) {
		if(StringUtils.isNotBlank(excludeUrl)) {
			this.excludeUrl = excludeUrl.split(",");
		}
	}
}
