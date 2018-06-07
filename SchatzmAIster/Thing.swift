//
//  Thing.swift
//  SchatzmAIster
//
//  Created by Roger Mürner on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation

class Thing : NSObject {
    
    let name : String
    let label : String
    let probability : Float
    
    init(name: String, label: String, probability: Float) {
        self.name = name
        self.label = label
        self.probability = probability
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? Thing {
            return name == object.name
        } else {
            return false
        }
    }
    
    override var hash: Int {
        return name.hashValue
    }
}
