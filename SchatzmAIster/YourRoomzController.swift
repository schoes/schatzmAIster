//
//  YourRoomzController.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit


class YourRoomzController:UIViewController,UITableViewDataSource, UITableViewDelegate{

    
    var allRooms : [Room] = []
    @IBOutlet weak var scannedRoomz: UITableView!
    
    override func viewDidLoad() {
            self.allRooms = RoomManager.sharedInstance.getRoomz()
        self.scannedRoomz.isHidden = !self.allRooms.isEmpty
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.allRooms = RoomManager.sharedInstance.getRoomz()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allRooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scannedRoomz.dequeueReusableCell(withIdentifier: "rooms") as! RoomTableViewCell
        
        cell.roomNameLabel.text = self.allRooms[indexPath.item].name
        cell.roomTypeImage.image = UIImage(named: getRoomTypeImage(room: allRooms[indexPath.item]))
        
        return cell
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func getRoomTypeImage(room:Room) -> String {
        switch room.type {
        case .livingroom:
            return "living_room_label"
        case .diningroom:
            return "esszimmer_label"
        default:
            return "office_label"
        }
    }
}
