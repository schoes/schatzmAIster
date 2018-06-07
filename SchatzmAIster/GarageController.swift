//
//  GarageController.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit
class GarageController: UIViewController{

    let roomManager = RoomManager.sharedInstance
    
    @IBAction func fullGarageClicked() {
        if !roomManager.hasAdditionalRoom(roomName: "Garage") {
            let room = roomManager.addAdditionalRoom()
            room.setStandard(standard: RoomStandard.luxury)
            room.name = "Garage"
        }

        back(self)

    }
    @IBAction func halfFullGarageClicked() {
        if !roomManager.hasAdditionalRoom(roomName: "Garage") {
            let room = roomManager.addAdditionalRoom()
            room.setStandard(standard: RoomStandard.normal)
            room.name = "Garage"
        }

        back(self)
    }
    @IBAction func emptyGarageClicked() {
        if !roomManager.hasAdditionalRoom(roomName: "Garage") {
            let room = roomManager.addAdditionalRoom()
            room.setStandard(standard: RoomStandard.minimal)
            room.name = "Garage"
        }

        back(self)
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
