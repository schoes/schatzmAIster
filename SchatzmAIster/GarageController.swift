//
//  GarageController.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit
class GarageController: UIViewController{
    
    @IBAction func fullGarageClicked() {
    }
    @IBAction func halfFullGarageClicked() {
    }
    @IBAction func emptyGarageClicked() {
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
