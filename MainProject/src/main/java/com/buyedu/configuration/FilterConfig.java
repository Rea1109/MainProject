package com.buyedu.configuration;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.filter.OrderedCharacterEncodingFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class FilterConfig {

// 한글 깨지는거 여기서 다 인코딩 해버림 	
	
	@Bean
    public FilterRegistrationBean encodingFilterBean() {
        FilterRegistrationBean registrationBean = new FilterRegistrationBean();
        CharacterEncodingFilter filter = new OrderedCharacterEncodingFilter();
        filter.setForceEncoding(true);
        filter.setEncoding("UTF-8");
        registrationBean.setFilter(filter);
        registrationBean.addUrlPatterns("/*");
        return registrationBean;
    }
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		// 파일 인코딩 -> utf-8 -> 당연함!
		multipartResolver.setDefaultEncoding("UTF-8"); 
		// 업로드 크기 제한 (5MB) -> 최대 몇메가 인지 정하기..?
		multipartResolver.setMaxUploadSizePerFile(15*1024*1024);
		
		return multipartResolver;
	}

}
