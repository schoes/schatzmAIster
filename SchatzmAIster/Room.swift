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
        type = determineType()
        determineName()
    }
    
    func changeName(newName: String) {
        NSLog("Changing name to " + newName)
        if (name != newName) {
            NSLog("Really changing name to " + newName)
            name = newName
            NSLog(newName)
            NotificationCenter.default.post(name: Notification.Name.nameChanged, object: nil, userInfo: ["name": newName])
        }
    }
    
    func determineName() {
        NSLog("Determining name: %d", String(self.type.hashValue))
        switch type {
        case .attic:
            changeName(newName: "Estrich")
        case .bathroom:
            changeName(newName: "Badzimmer")
        case .bedroom:
            changeName(newName: "Schlafzimmer")
        case .cellar:
            changeName(newName: "Keller")
        case .diningroom:
            changeName(newName: "Esszimmer")
        case .garage:
            changeName(newName: "Garage")
        case .kitchen:
            changeName(newName: "Küche")
        case .livingroom:
            changeName(newName: "Wohnzimmer")
        case .office:
            changeName(newName: "Büro")
        default:
            changeName(newName: "???")
        }
    }
    
    func determineType() -> RoomType {
        if (labels.contains("bedroom") || hasThing(name: "bed")) {
            return .bedroom
        }
        if (hasThing(name: "sofa") || hasThing(name: "seat")) {
            return .livingroom
        }
        if (hasThing(name: "table")) {
            return .diningroom
        }
        return .unknown
    }
    
    func hasThing(name: String) -> Bool {
        return contents.contains(where: {(thing: Thing) in return thing.name == name})
    }
    
    func value() -> Double {
        return Double(1.0)
}
    func standard() -> RoomStandard {
        return RoomStandard.minimal
    }
}
