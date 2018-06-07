//
//  Room.swift
//  SchatzmAIster
//
//  Created by John M. Hutchison on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Clarifai_Apple_SDK

class Room {
    var contents: [String] = []
    var name = "A Room"
    
    init() {
    }
    
    func acceptContents(concepts: [Concept]) {
        contents.removeAll()
        for concept in concepts {
            NSLog(concept.name + "   " + String(concept.score))
            contents.append(concept.name)
        }
    }
}
