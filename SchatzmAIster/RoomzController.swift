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

class RoomzController: UIViewController, AVCapturePhotoCaptureDelegate {
    @IBAction func roomScanned(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet var previewView: UIView!
    @IBOutlet weak var roomTypeNavigationItem: UINavigationItem!
    @IBOutlet weak var predictionStackView: UIStackView!
   
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var predictionEngine: PredictionEngine?
    var room: Room?
    
    override func viewDidLoad() {
        let livingRoom = UIImage(named: "living-room")
        
        roomTypeNavigationItem.title = "Wo bist du ??"
        super.viewDidLoad()
        
        room = Room.init()
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
            captureSession!.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the input device
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession!.addOutput(captureMetadataOutput)
            
            let photoOutput = AVCapturePhotoOutput()
            captureSession!.addOutput(photoOutput)
            let photoSettings = AVCapturePhotoSettings()
            photoSettings.flashMode = .off
            
            
            //Initialise the video preview layer and add it as a sublayer to the viewPreview view's layer
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer!.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer!.frame = view.layer.bounds
            
            previewView.layer.addSublayer(videoPreviewLayer!)
            
            //start video capture
            captureSession!.startRunning()
            
            photoOutput.capturePhoto(with: photoSettings, delegate: self)
            //predict(image: livingRoom!)
        } catch {
            //If any error occurs, simply print it out
            print(error)
            return
        }
    }
    
    func predict(image: UIImage) {
        predictionEngine?.predict(image: Image(image: image))
    }
    
    func handlePredictions(outputs: [Output]?, error: Error?) {
        for output in outputs! {
            room!.acceptContents(concepts: output.dataAsset.concepts!)
        }
    }
    
    internal func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            
        guard error == nil else {
            print("Failed Capturing Picture: \(String(describing: error!.localizedDescription))")
            return
        }
        NSLog("No Error")
        if let imageData = photo.fileDataRepresentation() {
            NSLog("Image Data")
            if let image = UIImage(data: imageData) {
                NSLog("Predicting...")
                predict(image: image)
            }
        }
    }
}

