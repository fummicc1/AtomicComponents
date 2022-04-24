import SwiftUI
import Combine
import AVFoundation

#if canImport(UIKit)

import UIKit

public struct iOSCameraView: UIViewControllerRepresentable {

    public init() { }

    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    public func makeUIViewController(context: Context) -> CameraViewController {
        let cameraViewController = CameraViewController(nibName: nil, bundle: nil)
        try? context.coordinator.prepare()
        context.coordinator.startRunning()
        cameraViewController.delegate = context.coordinator
        return cameraViewController
    }

    public func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {

    }

    public class Coordinator: NSObject, CameraViewControllerDelegate {
        var session: AVCaptureSession?
        var frontCamera: AVCaptureDevice?
        var frontCameraInput: AVCaptureDeviceInput?
        var photoOutput: AVCapturePhotoOutput?
        var previewLayer: AVCaptureVideoPreviewLayer?

        func prepare() throws {
            guard let camera = AVCaptureDevice.default(
                .builtInWideAngleCamera,
                for: .video, position: .front
            ) else {
                assertionFailure()
                return
            }
            let session = AVCaptureSession()
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            if session.canAddInput(cameraInput) {
                session.addInput(cameraInput)
            }
            let cameraOutput = AVCapturePhotoOutput()
            if session.canAddOutput(cameraOutput) {
                session.addOutput(cameraOutput)
            }

            self.frontCamera = camera
            self.frontCameraInput = cameraInput
            self.photoOutput = cameraOutput
            self.session = session
        }

        func startRunning() {
            session?.startRunning()
        }

        public func setupPreview(on view: UIView) throws {
            guard let session = session else {
                assertionFailure()
                return
            }
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.connection?.videoOrientation = .portrait
            previewLayer.frame = view.bounds
            view.layer.insertSublayer(previewLayer, at: 0)

            self.previewLayer = previewLayer
        }
    }
}

struct iOSCameraView_Previews: PreviewProvider {
    static var previews: some View {
        iOSCameraView()
    }
}

public protocol CameraViewControllerDelegate: AnyObject {
    func setupPreview(on view: UIView) throws
}

public class CameraViewController: UIViewController {
    weak var delegate: CameraViewControllerDelegate?

    public override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try delegate?.setupPreview(on: self.view)
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
}


#elseif canImport(AppKit)

import AppKit

public struct NSCameraView: NSViewControllerRepresentable {

    public init() { }

    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    public func makeNSViewController(context: Context) -> some NSViewController {
        let cameraViewController = CameraViewController(nibName: nil, bundle: nil)
        try? context.coordinator.prepare()
        context.coordinator.startRunning()
        cameraViewController.delegate = context.coordinator
        return cameraViewController
    }

    public func updateNSViewController(_ nsViewController: NSViewControllerType, context: Context) {
    }

    public class Coordinator: NSObject, CameraViewControllerDelegate {
        var session: AVCaptureSession?
        var frontCamera: AVCaptureDevice?
        var frontCameraInput: AVCaptureDeviceInput?
        var photoOutput: AVCapturePhotoOutput?
        var previewLayer: AVCaptureVideoPreviewLayer?

        func prepare() throws {
            guard let camera = AVCaptureDevice.default(
                .builtInWideAngleCamera,
                for: .video, position: .front
            ) else {
                assertionFailure()
                return
            }
            let session = AVCaptureSession()
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            if session.canAddInput(cameraInput) {
                session.addInput(cameraInput)
            }
            let cameraOutput = AVCapturePhotoOutput()
            if session.canAddOutput(cameraOutput) {
                session.addOutput(cameraOutput)
            }

            self.frontCamera = camera
            self.frontCameraInput = cameraInput
            self.photoOutput = cameraOutput
            self.session = session
        }

        func startRunning() {
            session?.startRunning()
        }

        public func setupPreview(on view: NSView) throws {
            guard let session = session else {
                assertionFailure()
                return
            }
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.connection?.videoOrientation = .portrait
            previewLayer.frame = view.bounds
            view.layer?.insertSublayer(previewLayer, at: 0)

            self.previewLayer = previewLayer
        }
    }
}

struct iOSCameraView_Previews: PreviewProvider {
    static var previews: some View {
        NSCameraView()
    }
}

public protocol CameraViewControllerDelegate: AnyObject {
    func setupPreview(on view: NSView) throws
}

public class CameraViewController: NSViewController {
    weak var delegate: CameraViewControllerDelegate?

    public override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try delegate?.setupPreview(on: self.view)
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
}

#endif
