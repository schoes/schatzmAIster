//
//  ThingFactory.swift
//  SchatzmAIster
//
//  Created by Roger Mürner on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Clarifai_Apple_SDK

class ThingFactory {
    
    let names : [String : String] = ["chair" : "Stuhl", "easy chair" : "Sessel", "seat" : "Sitz", "sofa": "Sofa", "table": "Tisch", "rug": "Teppich", "lamp": "Lampe", "vase": "Vase", "cabinet": "Schrank", "shelf": "Tablar", "bed": "Bett", "desk": "Schreibtisch", "computer": "Computer", "laptop": "Laptop"]
    
    
    
    let livingRoomLuxury  : [String : Int] = ["chair" :  596, "easy chair" :  800, "seat" :  580, "sofa" : 3000, "table" : 3800, "rug" :    0, "lamp" :  276, "vase" :    0, "cabinet" :  516, "shelf" :   40, "bed" : 3800, "desk" :  596, "computer" : 2000, "laptop" : 2000]
    let livingRoomNormal  : [String : Int] = ["chair" :  372, "easy chair" :  500, "seat" :  362, "sofa" : 1875, "table" : 2375, "rug" :    0, "lamp" :  172, "vase" :    0, "cabinet" :  322, "shelf" :  100, "bed" : 2375, "desk" :  372, "computer" : 1250, "laptop" : 1250]
    let livingRoomMinimal : [String : Int] = ["chair" :  149, "easy chair" :  200, "seat" :  145, "sofa" :  750, "table" :  950, "rug" :    0, "lamp" :   69, "vase" :    0, "cabinet" :  129, "shelf" :  160, "bed" :  950, "desk" :  149, "computer" :  500, "laptop" :  500]
    
    init() {
        
    }
    
    func extractThings(concepts: [Concept]) -> [Thing] {
        let things = concepts.filter({self.names.keys.contains($0.name)}).map({
            (concept: Concept) -> Thing in
            return Thing.init(name: concept.name, label: self.names[concept.name]!, probability: concept.score)
            })
        return things
    }
    
    func calculatePrice(things: [Thing], roomStandard: RoomStandard, roomType: RoomType) -> Int {
        let totalPrice = things.reduce(0){
            price, thing in
            return price + priceOfThing(thing: thing, roomStandard: roomStandard, roomType: roomType)
        }
        return totalPrice;
    }
    
    func priceOfThing(thing: Thing, roomStandard: RoomStandard, roomType: RoomType) -> Int {
        //switch roomType {
        //case RoomType.livingroom:
            return priceInLivingRoom(thing: thing, roomStandard: roomStandard)
        //default:
        //    return 0
        //}
    }
    
    func priceInLivingRoom(thing: Thing, roomStandard: RoomStandard) -> Int {
        switch roomStandard {
        case RoomStandard.luxury:
            return livingRoomLuxury[thing.name]!
        case RoomStandard.normal:
            return livingRoomNormal[thing.name]!
        case RoomStandard.minimal:
            return livingRoomMinimal[thing.name]!
        }
    }
}
