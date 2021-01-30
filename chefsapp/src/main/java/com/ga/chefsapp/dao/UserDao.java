package com.ga.chefsapp.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.ga.chefsapp.model.User;

import java.util.List;

public interface UserDao extends CrudRepository<User, Integer>{
	public User findByEmailAddress(String emailAddress);
	public User findById(int id);
//	@Query("Select NEW com.ga.chefsapp.model(u.first_name, u.email_address)From user u INNER JOIN recipe r on u.user_id = r.fk_user_id")

//	@Query("Select u.first_name, u.email_address From user u INNER JOIN recipe r on u.user_id = r.fk_user_id")
//	public  List<User> getChefs();
	
}
