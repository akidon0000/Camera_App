//
//  CameraViewController.swift
//  CameraApp
//
//  Created by Akihiro Matsuyama on 2023/07/27.
//

import UIKit
import AVFoundation

class CameraView: UIViewController {
    static func instantiate() -> CameraView {
        return UINib(nibName: "CameraView", bundle: nil).instantiate(withOwner: self, options: nil).first as! CameraView
    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        configure()
//        let view = UINib(nibName: "CameraView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        configure()
//    }
//
//    private func configure() {
////        let nib = UINib(nibName: "CameraView", bundle: nil)
////        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
////        addSubview(view)
//    }
//    //プロパティは省略
//    //storyboardで設置した時
//    init() {
//        super.init(frame: .zero)
//        let view = Bundle.main.loadNibNamed("CameraView", owner: self, options: nil)?.first as! UIView
//        let view = UINib(nibName: "CameraView", bundle: nil).instantiate(withOwner: self, options: nil).first as! UIView
////        view.frame = self.bounds
//        print(view.frame)
//        print(self.bounds)
//        addSubview(view)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        //viewのautolayout取得前//VCの制約決定前
//    }

//    var captureVideoLayer: AVCaptureVideoPreviewLayer!
//
//    var cameraView: UIView!
//    var cameraDevices: AVCaptureDevice!
//
//    var captureSession = AVCaptureSession()
//    var imageOutput = AVCapturePhotoOutput()

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


//    private func settingSession() {
//        // カメラの設定やセッションの組み立てはここで行う
//        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera],
//                                                                      mediaType: AVMediaType.video,
//                                                                      position: AVCaptureDevice.Position.unspecified)
//        // プロパティの条件を満たしたカメラデバイスの取得（バックカメラ）
//        let devices = deviceDiscoverySession.devices
//        for device in devices {
//            if device.position == AVCaptureDevice.Position.back {
//                cameraDevices = device
//            }
//        }
//        //バックカメラからVideoInputを取得
//        let videoInput: AVCaptureInput!
//        do {
//            videoInput = try AVCaptureDeviceInput.init(device: cameraDevices)
//        } catch {
//            videoInput = nil
//        }
//
//        //出力先を生成
//        imageOutput = AVCapturePhotoOutput()
//        //セッションに追加
//        captureSession.addInput(videoInput)
//        captureSession.addOutput(imageOutput)
//        //画像を表示するレイヤーを生成
//        captureVideoLayer = AVCaptureVideoPreviewLayer.init(session: captureSession)
//        captureVideoLayer.frame = self.bounds
//        captureVideoLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//
//        //Viewに追加
//        self.layer.insertSublayer(captureVideoLayer, at: 0)
//    }
//
//    private func startCapture() {
//        captureSession.startRunning()
//    }
//
//    private func stopCapture() {
//        captureSession.stopRunning()
//    }
}
