//
//  RoomTableViewCell.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var roomTypeImage: UIImageView!
    @IBOutlet weak var roomNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
