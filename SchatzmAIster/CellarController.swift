//
//  CellarController.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit
class CellarController: UIViewController {
    
    @IBAction func fullCellarClicked() {
    }
    @IBAction func halfFullCellarClicked() {
    }
    @IBAction func emptyCellarClicked() {
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
