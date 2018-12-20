//
//  RecipeTableViewCell.swift
//  recipeApp
//
//  Created by Adam Eliezerov on 07/12/2018.
//  Copyright © 2018 adameliezerov. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

	@IBOutlet weak var recipeTitle: UILabel!
	@IBOutlet weak var recipeImage: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
