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
    
    @IBAction func roomScanned(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var previewView: UIView!
    @IBOutlet weak var predictionStackView: UIStackView!
   
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var room: Room?
    var extractor: AIExtractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            setupRoom()
            setupVideoCaptureView()
            setupAIExtraction()
            start()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        extractor!.invalidate()
        extractor = nil
        NotificationCenter.default.removeObserver(self)
    }
    
    func start() {
        captureSession!.startRunning()
        extractor?.start()
    }
    
    @objc func addedContent(notification: Notification) -> Void {
        if let content = notification.userInfo!["thing"] as! Thing? {
            NSLog("Showing Bubble with content of" + content.name)
        }
    }
    
    func setupAIExtraction() {
        extractor = AIExtractor.init(captureSession: captureSession!, room: room!)
        NotificationCenter.default.addObserver(self, selector: #selector(addedContent(notification:)), name: NSNotification.Name.contentAdded, object: nil)
    }
    
    func setupRoom() {
        room = RoomManager.sharedInstance.addRoom()
    }
    
    func setupVideoCaptureView() {
        do {
            guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
                fatalError("No video device found")
            }
            // Get an instance of the AVCaptureDeviceInput class using the previous deivce object
            let input = try AVCaptureDeviceInput(device: captureDevice)
        
            // Initialize the captureSession object
            captureSession = AVCaptureSession()
            // Set the input devcie on the capture session
            captureSession!.addInput(input)
        
            // Initialize a AVCaptureMetadataOutput object and set it as the input device
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession!.addOutput(captureMetadataOutput)
        
            //Initialise the video preview layer and add it as a sublayer to the viewPreview view's layer
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer!.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer!.frame = view.layer.bounds
        
            previewView.layer.addSublayer(videoPreviewLayer!)
        
        } catch {
            //If any error occurs, simply print it out
            print(error)
            return
        }
    }
}

