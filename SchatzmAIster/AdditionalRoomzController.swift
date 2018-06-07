//
//  AdditionalRoomzController.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit

class AdditionalRoomzController : UIViewController{
    
    let roomManager = RoomManager.sharedInstance
    
    @IBOutlet weak var createAtticBtn: UIButton!
    @IBOutlet weak var vbQuestion: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if roomManager.hasAdditionalRoom(roomName: "attic") {
            createAtticBtn.setTitle("ändern", for: .normal)
        }
        vbQuestion.layer.borderWidth = 1
        vbQuestion.layer.cornerRadius = 10
        vbQuestion.layer.borderColor = UIColor.black.cgColor
        
    }

}
