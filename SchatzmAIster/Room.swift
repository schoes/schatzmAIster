//
//  Room.swift
//  SchatzmAIster
//
//  Created by John M. Hutchison on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Clarifai_Apple_SDK

class Room {
    var contents: [Thing] = []
    var name = "A Room"
    
    func acceptContents(things: [Thing]) {
        things.map { acceptContent(thing: $0) }
    }
    
    func acceptContent(thing: Thing) {
        if (!contents.contains(thing)) {
            addContent(newThing: thing)
        }
    }
    
    func addContent(newThing: Thing) {
        contents.append(newThing)
        NotificationCenter.default.post(name: Notification.Name.contentAdded, object: nil, userInfo: ["thing": newThing])
    }
    
    func value()->Double{
        return Double(1.0)
}
    func standard()->RoomStandard{
        return RoomStandard.minimal
    }
}
