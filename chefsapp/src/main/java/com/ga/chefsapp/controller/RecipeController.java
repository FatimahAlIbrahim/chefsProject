package com.ga.chefsapp.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.ga.chefsapp.dao.RecipeDao;
import com.ga.chefsapp.model.Recipe;
	
	
@Controller
public class RecipeController{
	
	@Autowired
	private RecipeDao dao;

// HTTP GET REQUEST - Recipe Add
	@GetMapping("/recipe/add")
	public ModelAndView addRecipe() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("recipe/add");
		
//		HomeController hc = new HomeController();
//		hc.setAppName(mv, env);
			
		return mv;
	}
	
	
	
	// HTTP POST REQUEST - Recipe Add
	@PostMapping("/recipe/add")
	public String addRecipe(Recipe recipe) {
		dao.save(recipe);	
		return "redirect:/recipe/index";
	}
	
	// HTTP GET REQUEST - Recipe Index
	@GetMapping("/Recipe/index")
	public ModelAndView getRecipe() {
		var it = dao.findAll();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("recipe/index");
		mv.addObject("recipes", it);
		
//		HomeController hc = new HomeController();
//		hc.setAppName(mv, env);
//		
		return mv;
	}
	
	// HTTP GET REQUEST - Recipe Detail
	@GetMapping("/recipe/detail")
	public ModelAndView recipeDetails(@RequestParam int id) {
//		System.out.println(id);
	
//		Recipe recipe = dao.findById(id);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("recipe/detail");
//		mv.addObject("recipe", recipe);
	
//		HomeController hc = new HomeController();
//		hc.setAppName(mv, env);
		
		return mv;
		
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
		
		
	}	