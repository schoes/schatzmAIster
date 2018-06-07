//
//  ThingFactory.swift
//  SchatzmAIster
//
//  Created by Roger Mürner on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Clarifai_Apple_SDK

class ThingFactory {
    
    let names = ["chair", "easy chair", "seat", "sofa", "table", "rug", "lamp", "vase", "cabinet", "shelf", "bed"]
    
    let livingRoomHigh : [String : Int] = ["sofa" : 3000, "easy chair" : 800]
    let livingRoomMedium : [String : Int] = ["sofa" : 1875, "easy chair" : 500]
    let livingRoomLow : [String : Int] = ["sofa" : 750, "easy chair" : 200]
    
    init() {
        
    }
    
    func extractThings(concepts: [Concept]) -> [Thing] {
        let things = concepts.filter({self.names.contains($0.name)}).map({
            (concept: Concept) -> Thing in
            return Thing.init(name: concept.name)
            })
        return things
    }
    
    func calculatePrice(things: [Thing], roomStandard: RoomStandard) -> Int {
        let totalPrice = things.reduce(0){
            price, thing in
            return price + priceOfThing(thing: thing, roomStandard: roomStandard)
        }
        return totalPrice;
    }
    
    func priceOfThing(thing: Thing, roomStandard: RoomStandard) -> Int {
        switch "" {
        case "living room":
            return priceInLivingRoom(thing: <#T##Thing#>, roomStandard: <#T##RoomStandard#>)
        default:
            <#code#>
        }
        return 0
    }
    
    func priceInLivingRoom(thing: Thing, roomStandard: RoomStandard) -> Int {
        switch roomStandard {
        case RoomStandard.luxury:
            return livingRoomHigh[thing.name]!
        default:
            return 0
        }
    }
}
