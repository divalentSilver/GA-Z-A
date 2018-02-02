//
//  StoryImageTableViewCell.swift
//  GoogleMapAPIPractice
//
//  Created by cscoi014 on 2018. 1. 31..
//  Copyright © 2018년 KaEun Rhee. All rights reserved.
//

import UIKit

class StoryImageTableViewCell: UITableViewCell {
    @IBOutlet weak var StoryImageView: UIImageView!
    @IBOutlet weak var StoryDateLabel: UILabel!
    @IBOutlet weak var StoryMemoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
