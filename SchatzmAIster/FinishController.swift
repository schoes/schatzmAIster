//
//  FinishController.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit

class FinishController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    var allRooms : [Room] = []

    @IBOutlet weak var scannedRoomz: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RoomManager.sharedInstance.getRoomz().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            RoomManager.sharedInstance.deleteRoom(index: indexPath.row)
            scannedRoomz.reloadData()
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! RoomTableViewCell
        
        //cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        
        cell.tableCellLabel.text = RoomManager.sharedInstance.getRoomz()[indexPath.row].name
        //cell.animalImage.image = UIImage(named: RoomManager.sharedInstance.getRoomz()[indexPath.row])
        cell.tableCellImg.image = UIImage(named: RoomManager.sharedInstance.getRoomz()[indexPath.row].name)
        //cell.animalImage.layer.cornerRadius = cell.animalImage.frame.height / 2
        return cell
    }
    
    
    override func viewDidLoad() {
        
        scannedRoomz.delegate = self
        scannedRoomz.dataSource = self
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scannedRoomz.reloadData()
    }
}
