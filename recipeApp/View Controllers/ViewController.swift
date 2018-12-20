//
//  ViewController.swift
//  recipeApp
//
//  Created by Adam Eliezerov on 06/12/2018.
//  Copyright © 2018 adameliezerov. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
	
	var recipes = [Recipe]()
	var filteredRecipes = [Recipe]()
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var searchField: UISearchBar!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view, typically from a nib.
		recipes = GetRecipesService.readJSON() // read the recipe JSON file
		filteredRecipes = recipes
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return filteredRecipes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipeTableViewCell
		let currentRecipe = filteredRecipes[indexPath.row]
		// resizing the photo to fit in tableViewCell
		let resizedPhoto = UIImageService.cropToBounds(image: currentRecipe.photo, width: 80, height: 80)
		cell.imageView?.image = resizedPhoto
		cell.recipeTitle.text = currentRecipe.title
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.performSegue(withIdentifier: "toDetail", sender: self)
	}
	
	
	// filtering function
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		// filter recipes (all elements lowercased) by ingredients or (||) title
		let filteredIngredients = searchText.components(separatedBy: ",")
		print(filteredIngredients)
		filteredRecipes = recipes.filter { $0.ingredients.contains(where: { $0.lowercased().contains(searchText.lowercased()) }) ||  $0.title.lowercased().contains(searchText.lowercased()) }
	//	filteredRecipes = recipes.filter { $0.ingredients.contains(array: filteredIngredients) ||  $0.title.lowercased().contains(searchText.lowercased())}
		// || $0.ingredients.contains(filteredIngredients)
		// check if search bar is empty and reset the tableview
		if searchField.text == "" {
			filteredRecipes = recipes
		}
		tableView.reloadData()
	}

	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// check if user is seguing to DetailViewController
		if segue.destination is DetailViewController {
			let vc = segue.destination as? DetailViewController
			// get selectedRow IndexPath
			if let indexPath = tableView.indexPathForSelectedRow {
				let currentRecipe = filteredRecipes[indexPath.row]
				vc?.recipeTitle = currentRecipe.title
				vc?.recipeDescription = currentRecipe.description
				vc?.recipeImage = currentRecipe.photo
				vc?.ingredients = currentRecipe.ingredients
				self.tableView.deselectRow(at: self.tableView.indexPathForSelectedRow!, animated: false)
			}
			
		}
		
	}
	


}

extension Array where Element: Equatable {
	func contains(array: [Element]) -> Bool {
		for item in array {
			if !self.contains(item) { return false }
		}
		return true
	}
}
