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
	public Recipe findById(int id);
	
	@Transactional
	@Modifying
	@Query(value="select * from User where user_id=(select fk_user_id from Recipe)", nativeQuery=true)//
	public Object[] findByFKuserId();
	
	//public Recipe findByFKuserId(int id);
}
