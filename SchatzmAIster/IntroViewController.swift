//
//  IntroViewController.swift
//  SchatzmAIster
//
//  Created by Jan Scheidegger on 08.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit

class IntroViewController:UIViewController{
    
    
    
    
    @IBAction func prenameEntered(_ sender: UITextField) {
         RoomManager.sharedInstance.prename = sender.text!
    }
}
