package com.ga.chefsapp.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ga.chefsapp.dao.RateDao;
import com.ga.chefsapp.dao.RecipeDao;
import com.ga.chefsapp.dao.UserDao;
import com.ga.chefsapp.helpers.ZXingHelper;
import com.ga.chefsapp.model.Rate;
import com.ga.chefsapp.model.Recipe;
import com.ga.chefsapp.model.User;

@Controller
public class RecipeController {

	@Autowired
	private RecipeDao dao;
	@Autowired
	private Environment env;
	@Autowired
	private UserDao userDao;
	@Autowired
	private RateDao rateDao;
	@Autowired
	HttpServletRequest request;

// HTTP GET REQUEST - Recipe Add
	@GetMapping("/recipe/add")
	public ModelAndView addRecipe() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("recipe/add");

		HomeController hc = new HomeController();
		hc.setAppName(mv, env);

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();

		User user = userDao.findByEmailAddress(email);
		mv.addObject("userId", user.getUserId());

		return mv;
	}

	// HTTP POST REQUEST - Recipe Add
	@PostMapping("/recipe/add")
	public String addRecipe(Recipe recipe) {
		dao.save(recipe);
		HttpSession session = request.getSession();
		session.setAttribute("addRecipeMessage", "your recipe has been added succssfuly");

		return "redirect:/recipe/index";
	}

	
	

	// HTTP GET REQUEST - Recipe Detail
	@GetMapping("/recipe/detail")
	public ModelAndView recipeDetails(@RequestParam int id) {
	System.out.println(id);
	
	Recipe recipe = dao.findById(id);
		

	// HTTP GET REQUEST - Recipe Index
	@GetMapping("/recipe/index")
	public ModelAndView getRecipe() {
		var it = dao.findByOrderedRating();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("recipe/index");
		mv.addObject("recipes", it);

		HomeController hc = new HomeController();
		hc.setAppName(mv, env);
		
		return mv;
	}

	// HTTP GET REQUEST - Recipe Detail
	@GetMapping("/recipe/detail")
	public ModelAndView recipeDetails(@RequestParam int id) {

		Recipe recipe = dao.findById(id);

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		User user = userDao.findByEmailAddress(email);
		boolean flag = true;

		ModelAndView mv = new ModelAndView();

		if (user != null) {

			Rate rate = rateDao.findByUserAndRecipe(user, recipe);

			if (rate == null) {
				flag = false;
			} else {
				flag = true;
			}
			mv.addObject("currentUser", user.getUserId());

		}

		mv.setViewName("recipe/detail");		


		mv.addObject("recipe", recipe);
		mv.addObject("flag", flag);


		HomeController hc = new HomeController();
		hc.setAppName(mv, env);

		return mv;

	}

	// adding rate to recipe
	@PostMapping("/recipe/detail")
	public String addRating(Rate rate) {
		rateDao.save(rate);

		HttpSession session = request.getSession();
		session.setAttribute("addRatingMessage", "your rating has been added succssfuly");
		return "redirect:/recipe/detail?id=" + rate.getRecipe().getId();
	}

	// HTTP GET REQUEST - Recipe Edit
	@GetMapping("/recipe/edit")
	public ModelAndView editRecipe(@RequestParam int id) {
//			Recipe recipe = dao.findById(id);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("recipe/edit");
//			mv.addObject("recipe",recipe);

//			HomeController hc = new HomeController();
//			hc.setAppName(mv, env);

//			

			
			
			return mv;
		}
		
		// HTTP GET REQUEST - Recipe Delete
		@GetMapping("/recipe/delete")
		public String deleteRecipe(@RequestParam int id) {
					
	dao.deleteById(id);
			return "redirect:/recipe/index";
		}
		
		
		// HTTP Get REQUEST - Select Recipe
		@GetMapping("/recipe/index")
		public ModelAndView recipeSelectrecipe(@RequestParam String first) {
		System.out.println(first);
		var recipes= dao.findByOrderedRating();	
		if (first.equals("All")) {
			
 recipes = dao.findByOrderedRating();
		}
		else {	recipes = dao.findByTypeParams(first);}
	
			ModelAndView mv = new ModelAndView();
//			mv.setViewName("recipe/selectrecipe");
			mv.setViewName("recipe/index");
		mv.addObject("recipes", recipes);
		
			HomeController hc = new HomeController();
		     hc.setAppName(mv, env);
			
			return mv;
			
		}	
	}	


		return mv;
	}

	// HTTP GET REQUEST - Recipe Delete
	@GetMapping("/recipe/delete")
	public String deleteRecipe(@RequestParam int id) {

		dao.deleteById(id);
		return "redirect:/recipe/index";
	}

}

