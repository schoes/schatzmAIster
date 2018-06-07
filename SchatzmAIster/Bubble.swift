//
//  Bubble.swift
//  SchatzmAIster
//
//  Created by Jan Scheidegger on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class Bubble : UILabel {

    init(frame: CGRect, text: String) {
        super.init(frame: frame)
        self.text = text
        self.textAlignment = NSTextAlignment.center
    }

    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        setup()
    }
    
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width / 2.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.bubbleUp()
    }
    
    func bubbleUp(duration: TimeInterval = 10.0, delay: TimeInterval =  0.0) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.frame.origin.y = 0
        }, completion: {finished in
            if(finished) {
                UIView.animate(withDuration: 3.0, delay: 7.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.layer.opacity = 0.0
                }, completion: nil)
            }
        })
    }
    
}
