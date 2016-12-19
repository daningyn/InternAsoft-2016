//
//  WhoToFollowTableViewCell.swift
//  React-Example
//
//  Created by Danh Nguyen on 12/19/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class WhoToFollowTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTouchXButton(_ sender: Any) {
        
    }
    
}
