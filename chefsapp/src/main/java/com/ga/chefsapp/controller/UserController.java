package com.ga.chefsapp.controller;

import java.util.Collection;
import java.util.List;

import javax.persistence.TypedQuery;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.ga.chefsapp.dao.RecipeDao;
import com.ga.chefsapp.dao.UserDao;
import com.ga.chefsapp.model.Recipe;
import com.ga.chefsapp.helpers.ZXingHelper;
import com.ga.chefsapp.model.User;

@Controller
public class UserController {

	@Autowired
	UserDao userDao;

	@Autowired
	RecipeDao recipeDao;

	@Autowired
	private Environment env;

	// to load the sign up form
	@GetMapping("/user/signup")
	public ModelAndView signup() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/signup");
		HomeController hc = new HomeController();
		hc.setAppName(mv, env);
		return mv;
	}

	// to post the sign up form (register user)
	@PostMapping("/user/signup")
	public ModelAndView signup(User user) {
		ModelAndView mv = new ModelAndView();
		
		HomeController hc = new HomeController();
		hc.setAppName(mv, env);

		var it = userDao.findAll();
		// check if the user already exists or not
		for (User dbUser : it) {
			if (dbUser.getEmailAddress().equals(user.getEmailAddress())) {
				mv.setViewName("user/signup");
				mv.addObject("signupFailMessage", "Email address is already exists");
				return mv;
			}
		}
		mv.addObject("signupSuccessMessage", "Your registeration has been successfully completed! Please login");

		mv.setViewName("user/login");
		
		// password Encryption
		BCryptPasswordEncoder bCrypt = new BCryptPasswordEncoder();
		String newPassword = bCrypt.encode(user.getPassword());
		user.setPassword(newPassword);

		userDao.save(user);
		return mv;
	}

	// to load the login form
	@GetMapping("/user/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/login");
//		mv.addObject("loginSuccessMessage", "Logged in successfully!");

		HomeController hc = new HomeController();
		hc.setAppName(mv, env);
		return mv;
	}

	// to load the user details
	@GetMapping("/user/detail")
	public ModelAndView userDetails(@RequestParam String email) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/detail");
		
		HomeController hc = new HomeController();
		hc.setAppName(mv, env);
		
		User user = userDao.findByEmailAddress(email);
		
		if(user.getPicture()== null) {
			user.setPicture("../images/profile.png");
		}
		
		var recipes = recipeDao.findAllByUser(user);
		mv.addObject("recipes",recipes);
		
		int count = recipeDao.countByUser(user);
		mv.addObject("count",count);
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		
		boolean flag = false;
		if(username.equals(user.getEmailAddress())) {
			flag = true;
		}
		
		mv.addObject("flag", flag);
		System.out.println(username);
		
		mv.addObject("user", user);

		return mv;
	}

	// to load all users having recipes
	@GetMapping("/chefs/index")
	public ModelAndView loadChefs() {

		ModelAndView mv = new ModelAndView();

		List<Object[]> chefs = userDao.findByFKuserId();
		mv.setViewName("chefs/index");
		mv.addObject("chefs", chefs);
		HomeController hc = new HomeController();
		hc.setAppName(mv, env);

		return mv;
		
	}

	@PostMapping("/user/edit")
	public String userEdit(User user) {
			BCryptPasswordEncoder bCrypt = new BCryptPasswordEncoder();
			String newPassword = bCrypt.encode(user.getPassword());
			user.setPassword(newPassword);
			userDao.save(user);
			return "redirect:/user/detail?email=" + user.getEmailAddress();
	}

	@GetMapping("/user/delete")
	public String userDelete(@RequestParam int id) {
		userDao.deleteById(id);
		return "redirect:/chefs/index";
	}

	@GetMapping("/user/detail/qrcode")
	public void qrcode(@RequestParam String email, HttpServletResponse response) throws Exception {
		String appName= env.getProperty("app.name");
		response.setContentType("image/png");
		OutputStream outputStream = response.getOutputStream();
		outputStream.write(ZXingHelper.getQRCode(appName+"user/detail?email=" + email, 200, 200));
		outputStream.flush();
		outputStream.close();
	}

	@GetMapping("/user/detail/qrcode/download")
	public String downloadQRCode(@RequestParam String email, HttpServletResponse response) throws MalformedURLException {
		//String appName = env.getProperty("app.name");
		User user = userDao.findByEmailAddress(email);
		String fileName = "Chef " + user.getFirstName() + " " + user.getLastName();
		final String baseUrl = ServletUriComponentsBuilder.fromCurrentContextPath().build().toUriString();
		System.out.println("url: "+ baseUrl);

		File downdloadDirDir = new File(System.getProperty("user.home"), "Downloads");
		String pathToDownloads = downdloadDirDir.getPath();
		
		try {
			URL url = new URL(baseUrl+"/user/detail/qrcode?email=" + email);
			HttpURLConnection http = (HttpURLConnection) url.openConnection();
			BufferedInputStream in = new BufferedInputStream(http.getInputStream());
			FileOutputStream fileOut = new FileOutputStream(new File(pathToDownloads+System.getProperty("file.separator")+fileName+".png"));
			BufferedOutputStream out = new BufferedOutputStream(fileOut, 1024);
			byte[] buffer = new byte[1024];
			int read = 0;
			while ((read = in.read(buffer, 0, 1024)) >= 0) {
				out.write(buffer, 0, read);
			}
			out.close();
			in.close();
			return "redirect:/user/detail?email=" + user.getEmailAddress();
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/user/detail?email=" + user.getEmailAddress();
		}
		
	}

}
