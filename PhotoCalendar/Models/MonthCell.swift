//
//  MonthCell.swift
//  PhotoCalendar
//
//  Created by Derrick Wong on 10/21/17.
//  Copyright © 2017 Derrick Wong. All rights reserved.
//

import UIKit

class MonthCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet var monthImage: UIImageView!
 
    var cellRow = 2
    
    var delegate: MonthCellImagePickerDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func addPhotoToCell(_ sender: Any) {
        self.delegate?.pickImage(row: cellRow)
        
        
        
    }
    
    
}

