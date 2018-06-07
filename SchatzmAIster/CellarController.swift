//
//  CellarController.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit
class CellarController: UIViewController {

    let roomManager = RoomManager.sharedInstance

    @IBAction func fullCellarClicked() {

        if !roomManager.hasAdditionalRoom(roomName: "Keller") {
            let room = roomManager.addAdditionalRoom()
            room.setStandard(standard: RoomStandard.luxury)
            room.name = "Keller"
        }

        back(self)

    }
    @IBAction func halfFullCellarClicked() {

        if !roomManager.hasAdditionalRoom(roomName: "Keller") {
            let room = roomManager.addAdditionalRoom()
            room.setStandard(standard: RoomStandard.normal)
            room.name = "Keller"
        }

        back(self)
    }
    @IBAction func emptyCellarClicked() {
        if !roomManager.hasAdditionalRoom(roomName: "Keller") {
            let room = roomManager.addAdditionalRoom()
            room.setStandard(standard: RoomStandard.minimal)
            room.name = "Keller"
        }

        back(self)

    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
