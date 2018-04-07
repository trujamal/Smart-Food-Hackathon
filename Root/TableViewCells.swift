//
//  YourAccountTableView.swift
//  YC
//
//  Created by VeveCorp on 7/13/16.
//  Copyright © 2016 VeveCorp. All rights reserved.
//

import UIKit
import IBAnimatable
import DropDown

class PostHaverest : UITableViewCell {
    @IBOutlet weak var question: AnimatableLabel!
    @IBOutlet weak var food_drop_down_menu: AnimatableButton!
    @IBOutlet weak var post_window: UIView!
    
    
    let dropDown = DropDown()
    
    // The view to which the drop down will appear on
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dropDown.anchorView = post_window
        dropDown.dataSource = ["Tomatoes", "Apple",
                               "Apricot",
                               "Avocado",
                               "Banana",
                               "Bilberry",
                               "Blackberry",
                               "Blackcurrant",
                               "Blueberry",
                               "Boysenberry",
                               "Buddha's hand",
                               "Crab apples",
                               "Currant",
                               "Cherry",
                               "Cherimoya",
                               "Chico fruit",
                               "Cloudberry",
                               "Coconut",
                               "Cranberry",
                               "Cucumber",
                               "Custard apple",
                               "Damson",
                               "Date",
                               "Dragonfruit",
                               "Durian",
                               "Elderberry",
                               "Feijoa",
                               "Fig",
                               "Goji berry",
                               "Gooseberry",
                               "Grape"]
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.dropDown.hide()

        }
        self.dropDown.show()
        self.dropDown.width = 20

    }
    // The list of items to display. Can be changed dynamically

    

    
    // Will set a custom width instead of the anchor view width
    
    override func prepareForReuse() {

    }
    
    
    
}

class FoodBank_Table_cell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var icon1: UIImageView!
    @IBOutlet weak var icon2: UIImageView!
    @IBOutlet weak var icon3: UIImageView!
    @IBOutlet weak var companyname: UILabel!
    @IBOutlet weak var detailview: UIButton!
    
    override func awakeFromNib() {
        
        
    }
    
    override func prepareForReuse() {
        
    }
}

class Garden_Table_cell: UITableViewCell {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var icon1: UIImageView!
    @IBOutlet weak var icon2: UIImageView!
    @IBOutlet weak var icon3: UIImageView!
    @IBOutlet weak var companyname: UILabel!
    @IBOutlet weak var detailview: UIButton!
    
    override func awakeFromNib() {
        
    }
    
    override func prepareForReuse() {
        
    }
}
