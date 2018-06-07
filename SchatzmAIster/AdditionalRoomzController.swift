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
    
    @IBOutlet weak var createGarageBtn: UIButton!
    @IBOutlet weak var createCellarBtn: UIButton!
    @IBOutlet weak var createAtticBtn: UIButton!
    @IBOutlet weak var vbQuestion: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if roomManager.hasAdditionalRoom(roomName: "Attic") {
            createAtticBtn.setTitle("ändern", for: .normal)
        }
        if roomManager.hasAdditionalRoom(roomName: "Cellar") {
            createCellarBtn.setTitle("ändern", for: .normal)
        }
        if roomManager.hasAdditionalRoom(roomName: "Garage") {
            createGarageBtn.setTitle("ändern", for: .normal)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    

        vbQuestion.layer.borderWidth = 1
        vbQuestion.layer.cornerRadius = 10
        vbQuestion.layer.borderColor = UIColor.black.cgColor
        
    }

}
