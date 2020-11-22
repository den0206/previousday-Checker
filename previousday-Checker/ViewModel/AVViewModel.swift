//
//  AVviewModel.swift
//  previousday-Checker
//
//  Created by 酒井ゆうき on 2020/11/22.
//

import Foundation
import SwiftUI
import Combine
import AVFoundation

final class AVViewModel : NSObject, AVCaptureVideoDataOutputSampleBufferDelegate,ObservableObject{
    
    @Published var showAlert = false
    @Published var alert : Alert = Alert(title: Text(""))
    
    var previewLayer : CALayer!
    private let captureSession = AVCaptureSession()
    private var capturepDevice : AVCaptureDevice!
    private let photoSetting = AVCapturePhotoSettings()
    
    
    override init() {
        super.init()
        beginSession()
    }
    
    private func beginSession() {
        
        captureSession.sessionPreset = .high
        
        if let availableDevice =
            AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualWideCamera], mediaType: AVMediaType.video, position: .front).devices.first {
                
            capturepDevice = availableDevice
            capturepDevice.isFocusModeSupported(.continuousAutoFocus)
            
            try! availableDevice.lockForConfiguration()
            availableDevice.focusMode = .continuousAutoFocus
            availableDevice.unlockForConfiguration()
        } else {
            self.showAlert = true
            self.alert = Alert(title: Text("カメラの動作する端末が必要です。"), message: nil, dismissButton: .default(Text("OK")))
            
            return
        }
        
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: capturepDevice)
            captureSession.addInput(captureDeviceInput)
            
        } catch {
            
            self.showAlert = true
            self.alert = Alert(title: Text(error.localizedDescription), message: nil, dismissButton: .default(Text("Ok")))
            
            
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        previewLayer.masksToBounds = true
        
        self.previewLayer = previewLayer
        
        let dateOutput = AVCaptureVideoDataOutput()
        dateOutput.videoSettings =
            [kCVPixelBufferWidthKey as String : kCVPixelFormatType_32BGRA]
        
        dateOutput.alwaysDiscardsLateVideoFrames = true
        
        if captureSession.canAddOutput(dateOutput) {
            captureSession.addOutput(dateOutput)
        }
        
        captureSession.commitConfiguration()
        
        let queue = DispatchQueue(label: "checker.AVFoundation")
        dateOutput.setSampleBufferDelegate(self, queue: queue)
        
        
    }
    
    func startSession() {
        if captureSession.isRunning {return}
        captureSession.startRunning()
    }
    
    func endSession() {
        if !captureSession.isRunning {return}
        captureSession.stopRunning()
    }
    
    
}
