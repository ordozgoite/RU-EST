//
//  BarCodeScannerView.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 18/03/23.
//

import SwiftUI
import AVFoundation

struct BarcodeScannerView: UIViewControllerRepresentable {
    
    @Binding var scannedCode: String?
    var completion: (() -> Void)?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<BarcodeScannerView>) -> BarcodeScannerViewController {
        let scannerViewController = BarcodeScannerViewController()
        scannerViewController.delegate = context.coordinator
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: BarcodeScannerViewController, context: UIViewControllerRepresentableContext<BarcodeScannerView>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, BarcodeScannerViewControllerDelegate {
        let parent: BarcodeScannerView
        
        init(parent: BarcodeScannerView) {
            self.parent = parent
        }
        
        func didCaptureBarcode(code: String) {
            parent.scannedCode = code
            parent.completion?()
        }
    }
}

protocol BarcodeScannerViewControllerDelegate: AnyObject {
    func didCaptureBarcode(code: String)
}

class BarcodeScannerViewController: UIViewController {
    weak var delegate: BarcodeScannerViewControllerDelegate?
    
    private var captureSession: AVCaptureSession!
    private var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
        setupPreviewLayer()
        startRunningCaptureSession()
    }
    
    private func setupCaptureSession() {
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.interleaved2of5]
        } else {
            return
        }
    }
    
    private func setupPreviewLayer() {
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
    }
    
    private func startRunningCaptureSession() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            self?.captureSession.startRunning()
        }
    }
    
    private func stopRunningCaptureSession() {
        captureSession.stopRunning()
    }
}

extension BarcodeScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let code = metadataObject.stringValue else { return }
        
        delegate?.didCaptureBarcode(code: code)
        stopRunningCaptureSession()
    }
}

