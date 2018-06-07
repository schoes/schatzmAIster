//
//  LabelFactory.swift
//  SchatzmAIster
//
//  Created by Roger Mürner on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Clarifai_Apple_SDK

class LabelFactory {
    
    let label = ["luxury", "contemporary", "bedroom", "dining room", "living room", "kitchen"]
    
    init() {
        
    }
    
    func extractLabels(concepts: [Concept]) -> [String]{
        let labels = concepts.filter({self.label.contains($0.name)}).map({
            (concept: Concept) -> String in
            return concept.name
        })
        return labels
    }
}
