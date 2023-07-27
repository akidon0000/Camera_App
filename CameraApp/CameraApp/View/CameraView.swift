//
//  CameraViewController.swift
//  CameraApp
//
//  Created by Akihiro Matsuyama on 2023/07/27.
//

import UIKit
import AVFoundation

class CameraView: UIView, AVCapturePhotoCaptureDelegate {

    var cameraView: UIView!
    var cameraDevices: AVCaptureDevice!
    var captureVideoLayer: AVCaptureVideoPreviewLayer!

    var captureSession = AVCaptureSession()
    var imageOutput = AVCapturePhotoOutput()

    var delegate: ProfileViewController?

    //コードで設置した時
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }

    private func loadNib() {
        settingSession()
        startCapture()
    }


    @IBAction func shootButton(_ sender: Any) {
//        let settings = AVCapturePhotoSettings()
//        settings.flashMode = .auto
//        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, 0.0)
//        imageOutput.capturePhoto(with: settings, delegate: self)
    }

    @IBAction func dismissButton(_ sender: Any) {
        delegate!.dismissCameraView()
    }



//    internal func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//        let imageData = photo.fileDataRepresentation()
//        //プロフィール画面への遷移
//        let resultViewController = ProfileViewController.instantiate(with: imageData! )
//        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationItem.backBarButtonItem = backButtonItem
//        navigationController?.navigationBar.tintColor = UIColor.white
//        navigationController?.pushViewController(resultViewController, animated:
//            true)
//    }


    private func settingSession() {
        // カメラの設定やセッションの組み立てはここで行う
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera],
                                                                      mediaType: AVMediaType.video,
                                                                      position: AVCaptureDevice.Position.unspecified)
        // プロパティの条件を満たしたカメラデバイスの取得（バックカメラ）
        let devices = deviceDiscoverySession.devices
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                cameraDevices = device
            }
        }
        //バックカメラからVideoInputを取得
        let videoInput: AVCaptureInput!
        do {
            videoInput = try AVCaptureDeviceInput.init(device: cameraDevices)
        } catch {
            videoInput = nil
        }

        //出力先を生成
        imageOutput = AVCapturePhotoOutput()
        //セッションに追加
        captureSession.addInput(videoInput)
        captureSession.addOutput(imageOutput)
        //画像を表示するレイヤーを生成
        captureVideoLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
        print(self.bounds)
        print(self.frame)
        captureVideoLayer.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 44)
        captureVideoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill

        //Viewに追加
        self.layer.insertSublayer(captureVideoLayer, at: 0)
    }

    private func startCapture() {
        captureSession.startRunning()
    }

    private func stopCapture() {
        captureSession.stopRunning()
    }
}
