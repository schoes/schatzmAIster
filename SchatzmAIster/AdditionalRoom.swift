//
//  AdditionalRoom.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation

class AdditionalRoom:Room {
    
    override func value() -> Double {
        
        if(standard() == RoomStandard.minimal){
            return Double(1.0)
        }
        
        else if(standard() == RoomStandard.minimal){
            return Double(2.0)
        }
        else{
            return Double(3.0)
        }
        
    }
    
    
    
}
