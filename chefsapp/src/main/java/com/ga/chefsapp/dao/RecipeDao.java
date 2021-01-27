package com.ga.chefsapp.dao;
import com.ga.chefsapp.model.Recipe;
import org.springframework.data.repository.CrudRepository;
public interface RecipeDao extends CrudRepository<Recipe, Integer> {
	public Recipe findById(int id);
}
