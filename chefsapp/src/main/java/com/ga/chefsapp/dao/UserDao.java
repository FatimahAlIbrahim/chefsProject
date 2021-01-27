package com.ga.chefsapp.dao;

import org.springframework.data.repository.CrudRepository;
import com.ga.chefsapp.model.User;

public interface UserDao extends CrudRepository<User, Integer>{
	public User findByEmailAddress(String emailAddress);
}
