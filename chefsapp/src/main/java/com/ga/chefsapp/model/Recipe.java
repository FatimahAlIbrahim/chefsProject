package com.ga.chefsapp.model;

import java.time.LocalDateTime;


import javax.persistence.*;


import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
@Entity
@Table(name="Recipe")
public class Recipe {
	@Id
	@GeneratedValue 
	private int id;
	
	private String name;
	private String picuter;
	private String description;
	private String ingredients;
	private String allergyWarnings;
	private String cusisne;
	private String type;
	private String durtion;
	private int servings;
	private int calories;
	
	@Column(name="createdAt", nullable = false, updatable = false)
	@CreationTimestamp
	private LocalDateTime createAt;
	
	@Column(name="updatedat", nullable = false, updatable = true)
	@UpdateTimestamp
	private LocalDateTime updateAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicuter() {
		return picuter;
	}

	public void setPicuter(String picuter) {
		this.picuter = picuter;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public String getAllergyWarnings() {
		return allergyWarnings;
	}

	public void setAllergyWarnings(String allergyWarnings) {
		this.allergyWarnings = allergyWarnings;
	}

	public String getCusisne() {
		return cusisne;
	}

	public void setCusisne(String cusisne) {
		this.cusisne = cusisne;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDurtion() {
		return durtion;
	}

	public void setDurtion(String durtion) {
		this.durtion = durtion;
	}

	public int getServings() {
		return servings;
	}

	public void setServings(int servings) {
		this.servings = servings;
	}

	public int getCalories() {
		return calories;
	}

	public void setCalories(int calories) {
		this.calories = calories;
	}

	public LocalDateTime getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDateTime createAt) {
		this.createAt = createAt;
	}

	public LocalDateTime getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(LocalDateTime updateAt) {
		this.updateAt = updateAt;
	}
}
