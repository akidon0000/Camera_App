//
//  CameraViewController.swift
//  CameraApp
//
//  Created by Akihiro Matsuyama on 2023/07/27.
//

import UIKit
import AVFoundation

class CameraView: UIView, AVCapturePhotoCaptureDelegate {

    @IBAction func button(_ sender: Any) {
        print("bbb")
    }

    //コードで設置した時
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //viewのautolayout取得前//VCの制約決定前
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //viewのautolayout取得前後//VCの制約決定前
    }

    private func loadNib() {
        settingSession()
        startCapture()
    }

    var captureVideoLayer: AVCaptureVideoPreviewLayer!

    var cameraView: UIView!
    var cameraDevices: AVCaptureDevice!

    var captureSession = AVCaptureSession()
    var imageOutput = AVCapturePhotoOutput()

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        settingSession()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        startCapture()
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        stopCapture()
//    }


//    @IBAction func shootButton(_ sender: Any) {
//        let settings = AVCapturePhotoSettings()
//        settings.flashMode = .auto
//        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, 0.0)
//        imageOutput.capturePhoto(with: settings, delegate: self)
//    }

//    @IBAction func didTapCloseButton(_ sender: Any) {
//        dismiss(animated: true)
//    }

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
        captureVideoLayer.frame = self.bounds
        captureVideoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill

        //Viewに追加
        self.layer.insertSublayer(captureVideoLayer, at: 3)
    }

    private func startCapture() {
        captureSession.startRunning()
    }

    private func stopCapture() {
        captureSession.stopRunning()
    }
}
