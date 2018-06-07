//
//  AtticController.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit

class AtticController: UIViewController {

    var roomManager = RoomManager.sharedInstance

    @IBAction func emptyAtticSelected() {
        if !roomManager.hasAdditionalRoom(roomName: "Attic") {
            let room = roomManager.addAdditionalRoom()
            room.setStandard(standard: RoomStandard.minimal)
            room.name = "Attic"
        }

        back(self)
    }

    @IBAction func halfFullAtticSelected() {

        if !roomManager.hasAdditionalRoom(roomName: "Attic") {
            let room = roomManager.addAdditionalRoom()
            room.setStandard(standard: RoomStandard.normal)
            room.name = "Attic"
        }
        back(self)
    }

    @IBAction func fullAtticSelected() {
        if !roomManager.hasAdditionalRoom(roomName: "Attic") {

            let room = roomManager.addAdditionalRoom()
            room.setStandard(standard: RoomStandard.luxury)
            room.name = "Attic"
        }
        back(self)
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
