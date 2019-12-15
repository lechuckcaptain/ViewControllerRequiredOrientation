//
//  ViewController.swift
//  TestOrientation
//
//  Created by Marco Pagliari on 15/12/2019.
//  Copyright © 2019 One4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var closeDialogButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.dismissDialog))

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if isModal {
            _ = addLeftBarButton(closeDialogButton)
        }

        print("Device orientation: \(UIDevice.current.orientation)")
        if (!isCurrentOrientationSupported()) {
            changeOrientation(preferredInterfaceOrientationForPresentation)
        }
    }
}

class HViewController: ViewController {

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        switch (UIDevice.current.orientation) {
        case UIDeviceOrientation.landscapeLeft:
            return .landscapeLeft
        case UIDeviceOrientation.landscapeRight:
           return .landscapeRight
        default:
            return .landscapeRight
        }
    }
}

class VViewController: ViewController {

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
}

extension NSObject {
    internal var typeName: String {
        return String(describing: type(of: self))
    }
}

extension UIViewController {

    func isCurrentOrientationSupported() -> Bool {
        var deviceInterfaceOrientationMask : UIInterfaceOrientationMask
        switch (UIDevice.current.orientation) {
        case UIDeviceOrientation.portrait:
            deviceInterfaceOrientationMask = .portrait
        case UIDeviceOrientation.portraitUpsideDown:
            deviceInterfaceOrientationMask = .portraitUpsideDown
        case UIDeviceOrientation.landscapeLeft:
            deviceInterfaceOrientationMask = .landscapeLeft
        case UIDeviceOrientation.landscapeRight:
            deviceInterfaceOrientationMask = .landscapeRight
        default:
            deviceInterfaceOrientationMask = .portrait
        }
        return (Int(deviceInterfaceOrientationMask.rawValue) & Int(supportedInterfaceOrientations.rawValue)) != 0
    }

    func changeOrientation(_ orientation: UIInterfaceOrientation) {
        print("Change orientation: \(orientation)")
        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
    }

    var isModal: Bool {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController

        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }

    func addLeftBarButton(_ button: UIBarButtonItem) -> Bool {
        if self.navigationItem.leftBarButtonItems == nil {
            self.navigationItem.leftBarButtonItems = []
        }

        if let items = navigationItem.leftBarButtonItems,
            !items.contains(button) {
            self.navigationItem.leftBarButtonItems?.insert(button,at: 0)
            return true
        } else {
            return false
        }
    }

    @IBAction
    @objc
    func dismissDialog() {
        self.dismiss(animated: true, completion: nil)
    }
}

class NavigationController: UINavigationController {

    override var shouldAutorotate: Bool {
        //        return false
        let sa = topViewController?.shouldAutorotate ?? super.shouldAutorotate
        print("Rotation - '\(self.typeName)' shouldAutorotate: \(sa)")
        return sa
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        //        return .portrait
        let sio = topViewController?.supportedInterfaceOrientations ?? super.supportedInterfaceOrientations
        print("Rotation - '\(self.typeName)' supportedInterfaceOrientations: \(sio)")
        return sio
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        let v = topViewController?.preferredInterfaceOrientationForPresentation ?? super.preferredInterfaceOrientationForPresentation
        print("Rotation - '\(self.typeName)' preferredInterfaceOrientationForPresentation: \(v)")
        return v
    }
}

//extension UINavigationController {
//
//    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        let sio = visibleViewController?.supportedInterfaceOrientations ?? super.supportedInterfaceOrientations
//        print("Rotation - '\(self.typeName)' supportedInterfaceOrientations: \(sio)")
//        return sio
//    }
//
//    public override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
//        return visibleViewController?.preferredInterfaceOrientationForPresentation ?? super.preferredInterfaceOrientationForPresentation
//    }
//
//    public override var shouldAutorotate: Bool {
//        let sa = visibleViewController?.shouldAutorotate ?? super.shouldAutorotate
//        print("Rotation - '\(self.typeName)' shouldAutorotate: \(sa)")
//        return sa
//    }
//}

extension UIInterfaceOrientationMask: CustomStringConvertible {

    public var description: String {
        var values : [String] = []
        if self.contains(.portrait) { values.append("Portrait") }
        if self.contains(.portraitUpsideDown) { values.append("PortraitUpsideDown") }
        if self.contains(.landscapeLeft) { values.append("LandscapeLeft") }
        if self.contains(.landscapeRight) { values.append("LandscapeRight") }
        if self.contains(.landscape) { values.append("Landscape") }
        if self.contains(.all) { values.append("All") }
        if self.contains(.allButUpsideDown) { values.append("AllButUpsideDown") }
        return "[\(values.joined(separator: ", "))]"
    }
}

extension UIInterfaceOrientation: CustomStringConvertible {

    public var description: String {
        let value: String
        switch self {
        case .unknown: value = "Unknown"
        case .portrait: value = "Portrait"
        case .portraitUpsideDown: value = "PortraitUpsideDown"
        case .landscapeLeft: value = "LandscapeLeft"
        case .landscapeRight: value = "LandscapeRight"
        @unknown default:
            fatalError()
        }
        return value
    }
}

extension UIDeviceOrientation: CustomStringConvertible {

    public var description: String {
        let value: String
        switch self {
        case .unknown: value = "Unknown"
        case .portrait: value = "Portrait"
        case .portraitUpsideDown: value = "PortraitUpsideDown"
        case .landscapeLeft: value = "LandscapeLeft"
        case .landscapeRight: value = "LandscapeRight"
        case .faceUp: value = "FaceUo"
        case .faceDown: value = "FaceDown"
        @unknown default:
            fatalError()
        }
        return value
    }
}



