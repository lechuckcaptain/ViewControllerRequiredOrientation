//
//  ViewController.swift
//  TestOrientation
//
//  Created by Marco Pagliari on 15/12/2019.
//  Copyright © 2019 One4. All rights reserved.
//

import UIKit
import Hero

class ViewController: UIViewController {

    lazy var closeDialogButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.dismissDialog))

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.hero.isEnabled = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if isModal {
            _ = addLeftBarButton(closeDialogButton)
        }

//        UIViewController.attemptRotationToDeviceOrientation()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        UIViewController.attemptRotationToDeviceOrientation()
    }
}

class HViewController: ViewController {

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
}

class VViewController: ViewController {

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

extension NSObject {
    internal var typeName: String {
        return String(describing: type(of: self))
    }
}

extension UIViewController {

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

    override func viewDidLoad() {
       super.viewDidLoad()
       self.hero.isEnabled = true
    }

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
        if self.contains(.landscapeLeft) { values.append("LandscapeLeft") }
        if self.contains(.landscapeRight) { values.append("LandscapeRight") }
        if self.contains(.portraitUpsideDown) { values.append("PortraitUpsideDown") }
        if self.contains(.landscape) { values.append("Landscape") }
        if self.contains(.all) { values.append("All") }
        if self.contains(.allButUpsideDown) { values.append("AllButUpsideDown") }
        return "[\(values.joined(separator: ", "))]"
    }
}
