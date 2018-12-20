//
//  DetailViewController.swift
//  recipeApp
//
//  Created by Adam Eliezerov on 07/12/2018.
//  Copyright © 2018 adameliezerov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	
	
	@IBOutlet weak var navBarTitle: UINavigationItem!
	var ingredients: [String] = []
	var recipeDescription = String()
	var recipeTitle = String()
	var recipeImage = UIImage()
	
	@IBOutlet weak var recipeDescriptionTxtView: UITextView!
	@IBOutlet weak var recipeTitleLabel: UILabel!
	@IBOutlet weak var recipeImageView: UIImageView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		navBarTitle.title = recipeTitle
		recipeTitleLabel.text = recipeTitle
		recipeDescriptionTxtView.text = recipeDescription
		recipeImageView.image = recipeImage
    }
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return ingredients.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell.init()
		cell.textLabel?.text = ingredients[indexPath.row]
		cell.textLabel?.font = Constants.DefaultFont
		return cell
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
