package com.ga.chefsapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ga.chefsapp.dao.UserDao;
import com.ga.chefsapp.model.User;

@Controller
public class UserController {
	
	@Autowired
	UserDao userDao;
	
	// to load the sign up form
	@GetMapping("/user/signup")
	public ModelAndView signup() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/signup");
		// place to get the app name from the home controller after it finishes
		return mv;
	}
	
	// to post the sign up form (register user)
	@PostMapping("/user/signup")
	public ModelAndView signup(User user) {
		ModelAndView mv = new ModelAndView();
		// place to get the app name from the home controller after it finishes
		
		//check if the user already exists or not
		var it = userDao.findAll();
		for (User dbUser : it) {
			if (dbUser.getEmailAddress().equals(user.getEmailAddress())) {
				mv.setViewName("user/signup");
				mv.addObject("message", "User already exists");
				return mv;
			}
		}
		mv.setViewName("user/login");
		// password Encryption
		BCryptPasswordEncoder bCrypt = new BCryptPasswordEncoder();
		String newPassword = bCrypt.encode(user.getPassword());
		user.setPassword(newPassword);

		userDao.save(user);
		mv.addObject("message", "User registered successfully");
		return mv;
	}
	
	
//	///////////////////////////////////////////////////////////////////////////////////
	
	// to load the login form
	@GetMapping("/user/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/login");
		// place to get the app name from the home controller after it finishes
		return mv;
	}
	
	// to post the login form (login user), will change it when implementing spring security
	@PostMapping("/user/login")
	public String login(User user) {
		BCryptPasswordEncoder bCryt = new BCryptPasswordEncoder();
		String emailAddress = user.getEmailAddress();
		String password = user.getPassword();
		User matchedUser = userDao.findByEmailAddress(emailAddress);
		if(matchedUser != null && bCryt.matches(password, matchedUser.getPassword())){
			return "redirect:/user/login?state=succes";
		}
		else {
			return "redirect:/user/login?state=failure";
		}
	}

}
