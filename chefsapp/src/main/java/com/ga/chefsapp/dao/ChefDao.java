package com.ga.chefsapp.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ga.chefsapp.model.User;


public interface ChefDao extends JpaRepository<User, Integer> {

//	@Query("Select u.first_name, u.email_address From user u INNER JOIN recipe r on u.user_id = r.fk_user_id")
//	public  List<User> getChefs();
}
