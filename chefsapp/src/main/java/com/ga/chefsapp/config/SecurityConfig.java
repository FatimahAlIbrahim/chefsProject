package com.ga.chefsapp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@EnableWebSecurity // marker annotation to apply this class to the global security, cuz we will
					// override some methods from there.
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	UserDetailsService userDetailsService;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	// Authentication
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		this.disableLocalConfigureAuthenticationBldr = true;
		auth.userDetailsService(userDetailsService);
	}

	// Authorization
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	
		http
		.authorizeRequests()
		.antMatchers("/recipe/add", "/recipe/edit", "/recipe/delete").hasAnyRole("USER", "ADMIN")
		.antMatchers("/user/delete").hasRole("ADMIN")
		
		.and()
		.formLogin()
		
		.and()
		.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
		.logoutSuccessUrl("/").deleteCookies("JSESSIONID").invalidateHttpSession(true);
	}

}