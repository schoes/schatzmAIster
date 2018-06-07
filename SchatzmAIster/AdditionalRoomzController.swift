//
//  AdditionalRoomzController.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit

class AdditionalRoomzController : UIViewController{
    @IBOutlet weak var vbQuestion: UILabel!
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vbQuestion.layer.borderWidth = 1
        vbQuestion.layer.cornerRadius = 10
        vbQuestion.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func roomzSelected(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func atticSelected(_ sender: UISwitch, forEvent event: UIEvent) {
    }
    @IBAction func cellarSelected(_ sender: UISwitch, forEvent event: UIEvent) {
    }
    @IBAction func garageSelected(_ sender: UISwitch, forEvent event: UIEvent) {
    }
}
