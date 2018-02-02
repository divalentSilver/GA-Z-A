//
//  PostTableViewCell.swift
//  GoogleMapAPIPractice
//
//  Created by cscoi044 on 2018. 2. 2..
//  Copyright © 2018년 KaEun Rhee. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var dateInfo: UILabel!
    @IBOutlet weak var imageInfo: UIImageView!
    @IBOutlet weak var memoInfo: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
