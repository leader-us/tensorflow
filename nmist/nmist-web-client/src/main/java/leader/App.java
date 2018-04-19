package leader;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication()
public class App extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {

		return application.sources(App.class);
	}

	public static void main(String[] args) throws Exception {

		SpringApplication.run(App.class, args);
		// Iterator<String> itors = ctx.getBeanFactory().getBeanNamesIterator();
		// while (itors.hasNext()) {
		// System.out.println(itors.next());
		// }
		// AbstractJsonpResponseBodyAdvice
	}
	// @Bean
	// @ConfigurationProperties(prefix = "spring.datasource")
	// public DataSource primaryDataSource() {
	// System.out.println("-------------------- DataSource init
	// ---------------------");
	// return DataSourceBuilder.create().build();
	// }
}