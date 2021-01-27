package com.ga.chefsapp.model;

import java.io.Serializable;

public class RateId implements Serializable{

	 private int user;

	    private int recipe;

		public RateId(int fK_userId, int fK_recipeId) {
			this.user = fK_userId;
			this.recipe = fK_recipeId;
		}
	    
	    
}
