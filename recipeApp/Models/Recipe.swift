//
//  Recipe.swift
//  recipeApp
//
//  Created by Adam Eliezerov on 07/12/2018.
//  Copyright © 2018 adameliezerov. All rights reserved.
//

import Foundation
import UIKit

class Recipe {
	
	var title: String
	var description: String
	var id: String
	var ingredients: [String]
	var photo: UIImage
	
	// initialize class "Recipe"
	init(title: String, description: String, id: String, ingredients: [String],photoLink: UIImage) {
		self.title = title
		self.description = description
		self.id = id
		self.ingredients = ingredients
		self.photo = photoLink
	}
}
