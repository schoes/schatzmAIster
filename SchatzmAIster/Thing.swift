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
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
