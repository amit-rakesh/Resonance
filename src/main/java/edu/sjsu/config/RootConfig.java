
package edu.sjsu.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScan.Filter;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;

import edu.sjsu.helpers.EmailNotification;
import edu.sjsu.helpers.S3Connector;
import edu.sjsu.services.BlogService;
import edu.sjsu.services.BlogServiceImpl;
import edu.sjsu.services.SongService;
import edu.sjsu.services.SongServiceImpl;
import edu.sjsu.services.UserService;
import edu.sjsu.services.UserServiceImpl;

@Configuration
@ComponentScan(basePackages = { "edu.sjsu" }, excludeFilters = {
		@Filter(type = FilterType.ANNOTATION, value = EnableWebMvc.class) })
@Import(JpaConfig.class)
public class RootConfig {

	@Bean
	public EmailNotification getEmailNotification() {
		return new EmailNotification();
	}

	@Bean
	public SongService getsongservice() {
		return new SongServiceImpl();
	}
	
	@Bean
	public BlogService getBlogservice() {
		return new BlogServiceImpl();
	}

	@Bean
	public S3Connector getS3Connector() {
		return new S3Connector();
	}

	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tiles = new TilesConfigurer();
		tiles.setDefinitions(new String[] { "WEB-INF/**/tiles.xml" });
		tiles.setCheckRefresh(true);
		return tiles;
	}
	
	

}
