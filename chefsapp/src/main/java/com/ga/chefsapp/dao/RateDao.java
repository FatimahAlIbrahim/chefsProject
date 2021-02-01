package com.ga.chefsapp.dao;

import org.springframework.data.repository.CrudRepository;

import com.ga.chefsapp.model.Rate;
import com.ga.chefsapp.model.Recipe;
import com.ga.chefsapp.model.User;


public interface RateDao extends CrudRepository<Rate, Integer>{

	public Rate findByUserAndRecipe(User userId, Recipe recipeId);

}
