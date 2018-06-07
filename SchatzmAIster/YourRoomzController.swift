//
//  YourRoomzController.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit


class YourRoomzController:UIViewController{
    var allRooms : [Room] = []
    @IBOutlet weak var scannedRoomz: UITableView!
    
    override func viewDidLoad() {
        self.allRooms = RoomManager.sharedInstance.getRoomz()
        
    }
}
