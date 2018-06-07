//
//  AdditionalRoom.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation

class AdditionalRoom:Room {

    var standard = RoomStandard.minimal
    
    func setStandard(standard:RoomStandard) {
        self.standard = standard;
    }

    override func value() -> Double {
        
        if(standard() == RoomStandard.minimal) {
            return Double(1.0)
        }
        
        else if(standard() == RoomStandard.normal) {
            return Double(2.0)
        }
        else{
            return Double(3.0)
        }
        
    }
    
    
    
}
