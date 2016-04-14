package edu.sjsu.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import edu.sjsu.interceptor.LoginInterceptor;

@Configuration
@EnableWebMvc
@ComponentScan("edu.sjsu")
public class WebConfig extends WebMvcConfigurerAdapter {

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		resolver.setExposeContextBeansAsAttributes(true);
		resolver.setOrder(2);
		resolver.setViewClass(org.springframework.web.servlet.view.JstlView.class);
		return resolver;
	}

	@Bean
	public TilesViewResolver tilesViewResolver() {
		TilesViewResolver tileResolver = new TilesViewResolver();
		tileResolver.setOrder(1);
		return tileResolver;
	}

	@Bean
	public LoginInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}

	@Bean
	public RequestMappingHandlerAdapter requestMappingHandlerAdapter() {

		RequestMappingHandlerAdapter rmha = new RequestMappingHandlerAdapter();
		// rmha.setCacheSecondsForSessionAttributeHandlers(0);
		rmha.setCacheSeconds(0);

		return rmha;
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		LoginInterceptor loginInterceptor = loginInterceptor();

		registry.addInterceptor(loginInterceptor).addPathPatterns("/song/*");
		registry.addInterceptor(loginInterceptor).addPathPatterns("/image");


	}
	
	 @Bean(name = "multipartResolver")
	    public StandardServletMultipartResolver resolver() {
	        return new StandardServletMultipartResolver();
	    }

	@Bean
	public StringHttpMessageConverter getStringHttpMessageConverter(){
		
		return new StringHttpMessageConverter();
	}
	
	@Bean
	public MappingJackson2HttpMessageConverter getMappingJackson2HttpMessageConverter(){
		
		return new MappingJackson2HttpMessageConverter();
	}
	
}
