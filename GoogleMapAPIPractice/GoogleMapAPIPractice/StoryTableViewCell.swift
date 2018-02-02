//
//  StoryTableViewCell.swift
//  GoogleMapAPIPractice
//
//  Created by cscoi044 on 2018. 2. 2..
//  Copyright © 2018년 KaEun Rhee. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {

    @IBOutlet weak var photoDate1: UILabel!
    
    @IBOutlet weak var photoImage1: UIImageView!
    
    @IBOutlet weak var photoMemo1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
