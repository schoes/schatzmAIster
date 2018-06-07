//
//  RoomManager.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
class RoomManager{
    static let sharedInstance = RoomManager()
    var roomz:[Room] = []
    var additionalRoomz:[AdditionalRoom] = []
    func addRoom()->Room{
        let room = Room()
        self.roomz.append(room);
        return room
    }
    
    func getRoomz()->[Room]{
        return self.roomz;
    }
    
    func addAdditionalRoom()->AdditionalRoom{
        let additionalRoom = AdditionalRoom()
        self.additionalRoomz.append(additionalRoom)
        return additionalRoom
    }
    
    func getAdditionalRoomz()->[AdditionalRoom]{
        return self.additionalRoomz
    }
}
