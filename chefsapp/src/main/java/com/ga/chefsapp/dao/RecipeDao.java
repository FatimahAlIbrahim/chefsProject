package com.ga.chefsapp.dao;

import com.ga.chefsapp.model.Recipe;

import com.ga.chefsapp.model.User;




import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface RecipeDao extends CrudRepository<Recipe, Integer> {

	@Query(value = "SELECT * FROM recipe order by\n"
	  		+ "									(\n"
	  		+ "                                    select avg(rating)\n"
	  		+ "                                    from rate \n"
	  		+ "                                    where recipe.id =  recipe\n"
	  		+ "                                    group by recipe\n"
	  		+ "									\n"
	  		+ "                                ) DESC",
	            nativeQuery=true)
	public Iterable<Recipe> findByOrderedRating();
	  
	    


	public Recipe findById(int id);


}
