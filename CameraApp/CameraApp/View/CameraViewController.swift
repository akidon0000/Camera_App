//
//  CameraViewController.swift
//  CameraApp
//
//  Created by Akihiro Matsuyama on 2023/07/26.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    static func instantiate() -> CameraViewController {
        return UIStoryboard(name: "Camera", bundle: nil).instantiateInitialViewController() as! CameraViewController
    }

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var captureButton: UIButton!

    var cameraDevices: AVCaptureDevice!

    var captureSession = AVCaptureSession()
    var imageOutput = AVCapturePhotoOutput()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingSession()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startCapture()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopCapture()
    }


    @IBAction func shootButton(_ sender: Any) {
        stopCapture()
//        cameraView.isHidden = true
//        let settings = AVCapturePhotoSettings()
//        settings.flashMode = .auto
//        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, 0.0)
//        imageOutput.capturePhoto(with: settings, delegate: self)

    }

//    @IBAction func didTapCloseButton(_ sender: Any) {
//        dismiss(animated: true)
//    }

    internal func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//        let imageData = photo.fileDataRepresentation()
//        //プロフィール画面への遷移
//        let resultViewController = ProfileViewController.instantiate(with: imageData! )
//        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//        navigationItem.backBarButtonItem = backButtonItem
//        navigationController?.navigationBar.tintColor = UIColor.white
//        navigationController?.pushViewController(resultViewController, animated:
//            true)
    }


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
        let captureVideoLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
        captureVideoLayer.frame = self.view.bounds
        captureVideoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill

        //Viewに追加
        self.view.layer.insertSublayer(captureVideoLayer, at: 1)
    }

    private func startCapture() {
        captureSession.startRunning()
    }

    private func stopCapture() {
        captureSession.stopRunning()
    }
}
