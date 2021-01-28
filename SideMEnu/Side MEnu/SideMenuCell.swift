//
//  SideMenuCell.swift
//  Retail App
//
//  Created by SRINIVASULU on 08/04/20.
//  Copyright © 2020 SRINIVASULU. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {
    @IBOutlet weak var imgView_Logo: UIImageView!
    @IBOutlet weak var lbl_Name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
