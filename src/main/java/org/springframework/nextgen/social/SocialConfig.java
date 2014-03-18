package org.springframework.nextgen.social;

import javax.inject.Inject;
import javax.sql.DataSource;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.connect.web.ConnectController;
import org.springframework.social.connect.web.ProviderSignInController;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;

@Configuration
public class SocialConfig {

	
	//private static String FACEBOOK_CLIENTID= "669df6cc9b11c3226b2f3e31b083acb2";
	
	// private static String  FACEBOOK_CLIENTSECRET = "516af1d8f60e8f6364fddca8f0bc46bf";
	
	// my configuration below
	
	
	// for local 
	 private static String FACEBOOK_CLIENTID= "606662689417866";
	
     private static String  FACEBOOK_CLIENTSECRET = "a60ccb1580975f2ce877d2e5fbf84818";
		
	
     // for google app engine
	
	// private static String FACEBOOK_CLIENTID= "1404001236531536";
		
   // private static String  FACEBOOK_CLIENTSECRET = "51c1e65b3f1cff6c6ef9895201e0a5d0";
		
     
   
    
	
	@Inject
	private DataSource dataSource;
	
	
	@Bean
	public ConnectionFactoryLocator connectionFactoryLocator() {
	    ConnectionFactoryRegistry registry = new ConnectionFactoryRegistry();
	    registry.addConnectionFactory(new FacebookConnectionFactory(FACEBOOK_CLIENTID,FACEBOOK_CLIENTSECRET));
	    return registry;
	}


	
	@Bean
	public UsersConnectionRepository usersConnectionRepository() {
	    JdbcUsersConnectionRepository repository = new JdbcUsersConnectionRepository(dataSource, 
	        connectionFactoryLocator(), Encryptors.noOpText());
	    repository.setConnectionSignUp(new SimpleConnectionSignUp());
	    return repository;
	}
	
	
	@Bean
	@Scope(value="request", proxyMode=ScopedProxyMode.INTERFACES)
	public ConnectionRepository connectionRepository() {
	    User user = SecurityContext.getCurrentUser();
	    return usersConnectionRepository().createConnectionRepository(user.getId());
	}
	
	@Bean
	@Scope(value="request", proxyMode=ScopedProxyMode.INTERFACES)   
	public Facebook facebook() {
	    return connectionRepository().getPrimaryConnection(Facebook.class).getApi();
	}
	
//
//	@Bean
//	public ProviderSignInController providerSignInController() {
//		
//		ProviderSignInController providerSignInController =  new ProviderSignInController(connectionFactoryLocator(), usersConnectionRepository(),
//		        new SimpleSignInAdapter());
//		
//		// providerSignInController.setApplicationUrl("http://localhost:8080/NextGen/home");
//
//
//		providerSignInController.setPostSignInUrl("http://localhost:8080/NextGen/home");
//		
//	    return providerSignInController;
//	    		
//	    		
//	}

	
	
//	  @Bean
//    public ConnectController connectController() {
//        ConnectController controller = new ConnectController(
//            connectionFactoryLocator(), connectionRepository());
//        controller.setApplicationUrl("entertainmentunlimited001.appspot.com/home");
//        return controller;
//    }
	
	  @Bean
	    public ConnectController connectController() {
	        ConnectController controller = new ConnectController(
	            connectionFactoryLocator(), connectionRepository());
	       // controller.setApplicationUrl("http://localhost:8080/NextGen/home");
	        return controller;
	    }
	
	

}


