//
//  ThingFactory.swift
//  SchatzmAIster
//
//  Created by Roger Mürner on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Clarifai_Apple_SDK

class ThingFactory {
    
    let names = ["Chair", "Easy Chair"]
    
    init() {
        
    }
    
    func extractThings(concepts: [Concept]) -> [Thing]{
        let things = concepts.filter({self.names.contains($0.name)}).map({
            (concept: Concept) -> Thing in
            return Thing.init(name: concept.name)
            })
        return things
    }
}
