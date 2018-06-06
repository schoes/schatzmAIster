//
//  Roomz.swift
//  SchatzmAIster
//
//  Created by Sven Schoeni on 06.06.18.
//  Copyright © 2018 Sven Schoeni. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import Clarifai_Apple_SDK

var captureSession: AVCaptureSession?
var videoPreviewLayer: AVCaptureVideoPreviewLayer?

class RoomzController: UIViewController {
    
    @IBOutlet var previewView: UIView!
    @IBOutlet weak var roomTypeNavigationItem: UINavigationItem!
    @IBOutlet weak var predictionStackView: UIStackView!
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var predictionEngine: PredictionEngine?
    var concepts: [Concept] = []
    
    override func viewDidLoad() {
        roomTypeNavigationItem.title = "Wo bist du ??"
        super.viewDidLoad()
        let livingRoom = UIImage(named: "living-room")
        
        predictionEngine = PredictionEngine.init(model: Clarifai.sharedInstance().generalModel, handler: handlePredictions)
        
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
            fatalError("No video device found")
        }
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous deivce object
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Initialize the captureSession object
            captureSession = AVCaptureSession()
            
            // Set the input devcie on the capture session
            captureSession?.addInput(input)
            
            predictionEngine?.predict(image: Image(image: livingRoom))
            
            // Initialize a AVCaptureMetadataOutput object and set it as the input device
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            //Initialise the video preview layer and add it as a sublayer to the viewPreview view's layer
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            previewView.layer.addSublayer(videoPreviewLayer!)
            
            //start video capture
            captureSession?.startRunning()
        
        
        } catch {
            //If any error occurs, simply print it out
            print(error)
            return
        }
        
        
    }
    
    func handlePredictions(outputs: [Output]?, error: Error?) {
        self.concepts.removeAll()
        for output in outputs! {
            self.concepts.append(contentsOf: output.dataAsset.concepts!)
        }
        clearStackView()
        buildStackView(concepts: self.concepts)
    }
    
    func clearStackView() {
        for subview in self.predictionStackView.subviews {
            self.predictionStackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
    
    func buildStackView(concepts: [Concept]) {
        for concept in concepts {
            let subview: UIPredictionStackView = UIPredictionStackView()
            NSLog(concept.name)
            subview.objectLabel.text = concept.name
            subview.predictionLabel.text = String(concept.score)
            self.predictionStackView.addArrangedSubview(subview)
        }
    }
}
