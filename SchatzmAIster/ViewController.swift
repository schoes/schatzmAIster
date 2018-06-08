//
//  ViewController.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 28.05.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import UIKit
import Clarifai_Apple_SDK

class ViewController: UIViewController {

    @IBOutlet weak var prename: UILabel!
    @IBOutlet weak var helloPrename: UILabel!
    @IBOutlet weak var vbText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vbText.layer.borderWidth = 1
        vbText.layer.cornerRadius = 10
        vbText.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view, typically from a nib.
        
        prename.text = RoomManager.sharedInstance.prename

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

