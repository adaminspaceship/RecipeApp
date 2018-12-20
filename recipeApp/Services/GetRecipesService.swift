//
//  GetRecipesService.swift
//  recipeApp
//
//  Created by Adam Eliezerov on 07/12/2018.
//  Copyright © 2018 adameliezerov. All rights reserved.
//

import Foundation
import SwiftyJSON // using pod 'SwiftyJSON'


struct GetRecipesService {
	static func readJSON() -> [Recipe] {
		var recipes = [Recipe]()
		if let path = Bundle.main.path(forResource: "recipes", ofType: "json") {
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
				let jsonObj = try JSON(data: data)
				for element in jsonObj["Recipes"] {
					// get all values from JSON
					let title = element.1["Title"].stringValue
					let description = element.1["Description"].stringValue
					let ID = element.1["ID"].stringValue
					let ingredients = element.1["Ingredients"].arrayObject
					let photoLink = element.1["PhotoLink"].stringValue
					
					recipes.append(Recipe(title: title, description: description, id: ID, ingredients: ingredients as? [String] ?? [], photoLink: UIImageService.urlToUIImage(url: photoLink) )) // append to the recipe array
				}
			} catch let error {
				print("parse error: \(error.localizedDescription)")
			}
		} else {
			print("Invalid filename/path.")
		}
		return recipes
	}
	
	
	
}
