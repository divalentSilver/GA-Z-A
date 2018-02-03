//
//  FromDateTableViewCell.swift
//  GoogleMapAPIPractice
//
//  Created by cscoi045 on 2018. 2. 3..
//  Copyright © 2018년 KaEun Rhee. All rights reserved.
//

import UIKit

class FromDateTableViewCell: UITableViewCell {

    @IBOutlet weak var fromDate: UIDatePicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
