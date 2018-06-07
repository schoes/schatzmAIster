//
//  AIExtractor.swift
//  SchatzmAIster
//
//  Created by John M. Hutchison on 07.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import AVFoundation
import Clarifai_Apple_SDK
import UIKit

class AIExtractor : NSObject, AVCapturePhotoCaptureDelegate {
    
    var timer: Timer?
    let photoOutput: AVCapturePhotoOutput
    let predictionEngine: PredictionEngine
    
    init(captureSession: AVCaptureSession, room: Room) {
        
        photoOutput = AVCapturePhotoOutput()
        captureSession.addOutput(photoOutput)
        
        predictionEngine = PredictionEngine.init(model: Clarifai.sharedInstance().generalModel, handler: PredictionHandler(room: room))
        
        super.init()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(1), repeats: true, block:{ (timer: Timer) in
            self.capturePhoto()
        })
    }
    
    func invalidate() {
        timer!.invalidate()
        timer = nil
    }
    
    func createSettings() -> AVCapturePhotoSettings {
        let photoSettings = AVCapturePhotoSettings()
        photoSettings.flashMode = .off
        return photoSettings
    }
    
    func capturePhoto() {
        photoOutput.capturePhoto(with: createSettings(), delegate: self)
    }
    
    func predict(image: UIImage) {
        predictionEngine.predict(image: Image(image: image))
    }
    
    internal func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard error == nil else {
            print("Failed Capturing Picture: \(String(describing: error!.localizedDescription))")
            return
        }
        if let imageData = photo.fileDataRepresentation() {
            if let image = UIImage(data: imageData) {
                predict(image: image)
            }
        }
    }
}

class PredictionHandler {
    
    let room: Room
    
    init(room: Room) {
        self.room = room
    }
    
    func handlePredictions(outputs: [Output]?, error: Error?) {
        for output in outputs! {
            
            room.acceptContents(concepts: output.dataAsset.concepts!)
        }
    }
    
}
