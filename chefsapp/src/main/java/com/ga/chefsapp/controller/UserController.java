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
import java.net.URL;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ga.chefsapp.dao.ChefDao;
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


//	//////////////////////////////////////////////////////////////////////////////////////

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
		// place to get the app name from the home controller after it finishes
		HomeController hc = new HomeController();
		hc.setAppName(mv, env);

		// check if the user already exists or not
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
		HomeController hc = new HomeController();
		hc.setAppName(mv, env);
		return mv;
	}

	// to post the login form (login user), will change it when implementing spring
	// security
//	@PostMapping("/user/login")
//	public String login(User user) {
//		BCryptPasswordEncoder bCrypt = new BCryptPasswordEncoder();
//		String emailAddress = user.getEmailAddress();
//		String password = user.getPassword();
//		User matchedUser = userDao.findByEmailAddress(emailAddress);
//		if (matchedUser != null && bCrypt.matches(password, matchedUser.getPassword())) {
//			return "redirect:/user/login?state=succes";
//		} else {
//			return "redirect:/user/login?state=failure";
//		}
//	}

//	/////////////////////////////////////////////////////////////////////////////////////////

	// to load the user details
	@GetMapping("/user/detail")
	public ModelAndView userDetails(@RequestParam int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/detail");
		
		HomeController hc = new HomeController();
		hc.setAppName(mv, env);
		
		User user = userDao.findById(id);
		mv.addObject("user", user);

		return mv;
	}

	/////////////////////////////////////////////////////////////
	// to load all users having recipes
	@GetMapping("/chefs/index")
	public ModelAndView loadChefs() {

		ModelAndView mv = new ModelAndView();

		var it = userDao.findByFKuserId();
		
		mv.setViewName("chefs/index");
		mv.addObject("chefs", it);
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
		return "redirect:/user/detail?id=" + user.getUserId();
	}

	@GetMapping("/user/delete")
	public String userDelete(@RequestParam int id) {
		userDao.deleteById(id);
		return "redirect:/chefs/index";
	}

	@GetMapping("/user/detail/qrcode")
	public void qrcode(@RequestParam int id, HttpServletResponse response) throws Exception {
		response.setContentType("image/png");
		OutputStream outputStream = response.getOutputStream();
		outputStream.write(ZXingHelper.getQRCode("/chefsapp/user/detail?=" + id, 200, 200));
		outputStream.flush();
		outputStream.close();
	}

	@GetMapping("/user/detail/qrcode/download")
	public String downloadQRCode(@RequestParam int id, HttpServletResponse response) {
		String appName = env.getProperty("app.name");
		User user = userDao.findById(id);
		String fileName = "Chef " + user.getFirstName() + " " + user.getLastName();

		File downdloadDirDir = new File(System.getProperty("user.home"), "Downloads");
		String pathToDownloads = downdloadDirDir.getPath();
		
		try {
			URL url = new URL("http://localhost:8082"+appName + "user/detail/qrcode?id=" + id);
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
			return "redirect:/user/detail?id=" + user.getUserId();
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/user/detail?id=" + user.getUserId();
		}
	}

}
