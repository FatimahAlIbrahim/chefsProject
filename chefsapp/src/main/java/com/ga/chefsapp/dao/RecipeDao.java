package com.ga.chefsapp.dao;

import com.ga.chefsapp.model.Recipe;
import com.ga.chefsapp.model.User;

import java.util.Collection;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface RecipeDao extends CrudRepository<Recipe, Integer> {

	@Query(value = "SELECT * FROM recipe order by\n"
	  		+ "									(\n"
	  		+ "                                    select avg(rating)\n"
	  		+ "                                    from rate \n"
	  		+ "                                    where recipe.id =  fk_recipe_id\n"
	  		+ "                                    group by fk_recipe_id\n"
	  		+ "									\n"
	  		+ "                                ) DESC",
	            nativeQuery=true)
	public Iterable<Recipe> findByOrderedRating();
	    public Recipe findById(int id);
	    

	public Recipe findById(int id);

}
