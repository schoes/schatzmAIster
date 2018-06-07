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
    var labels: Set<String> = []
    var name = "???"
    var type = RoomType.unknown
    
    func acceptContents(things: [Thing]) {
        things.forEach { acceptContent(thing: $0) }
    }
    
    func acceptContent(thing: Thing) {
        if (!contents.contains(thing)) {
            addContent(newThing: thing)
        }
    }
    
    func acceptLabels(newLabels: [String]) {
        let base = labels.count
        
        newLabels.forEach { labels.insert($0) }
        
        if (base < labels.count) {
            determineName()
        }
    }
    
    func addContent(newThing: Thing) {
        contents.append(newThing)
        NotificationCenter.default.post(name: Notification.Name.contentAdded, object: nil, userInfo: ["thing": newThing])
        determineType()
        determineName()
    }
    
    func changeName(newName: String) {
        if (name != newName) {
            name = newName
            NotificationCenter.default.post(name: Notification.Name.nameChanged, object: nil, userInfo: ["name": newName])
        }
    }
    
    func determineName() {
        switch type {
        case .bedroom:
            changeName(newName: "Schlafzimmer")
        case .diningroom:
            changeName(newName: "Esszimmer")
        case .kitchen:
            changeName(newName: "Küche")
        case .livingroom:
            changeName(newName: "Wohnzimmer")
        default:
            changeName(newName: "???")
        }
    }
    
    func determineType() {
        if (labels.contains("bedroom")) {
            type = RoomType.bedroom
        }
        
    }
    
    func value() -> Double {
        return Double(1.0)
}
    func standard() -> RoomStandard {
        return RoomStandard.minimal
    }
}
