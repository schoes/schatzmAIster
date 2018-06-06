//
//  PredictionEngine.swift
//  SchatzmAIster
//
//  Created by John M. Hutchison on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Clarifai_Apple_SDK

class PredictionEngine {
    
    typealias PredictionHandler = ([Output]?, Error?) -> Void
    
    let model: Model;
    let predictionHandler: PredictionHandler
    
    init(model: Model, handler: @escaping PredictionHandler) {
        self.model = model
        self.predictionHandler = handler
    }
    
    func predict(image: Image) {
        let dataAsset = DataAsset.init(image: image)
        let input = Input.init(dataAsset: dataAsset)
        let inputs = [input]
        self.model.predict(inputs, completionHandler: predictionHandler)
        
    }
}
