//
//  RoomManager.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
class RoomManager{
    static var sharedInstance = RoomManager()
    var roomz:[Room] = []
    func addRoom()->Room{
        let room = Room()
        self.roomz.append(room);
        return room
    }
    
    func deleteRoom(index: Int) {
        roomz.remove(at: index)
    }

    func hasAdditionalRoom(roomName: String) -> Bool {
        for room in roomz {
            NSLog("name %s", room.name)
            if room.name == roomName {
                return true
            }
        }
        return false;
    }

    
    func getRoomz()->[Room]{
        return self.roomz;
    }
    
    func addAdditionalRoom()->AdditionalRoom{
        let additionalRoom = AdditionalRoom()
        self.roomz.append(additionalRoom)
        return additionalRoom
    }
    
}
