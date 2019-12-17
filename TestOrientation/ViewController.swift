import UIKit

class ViewController: UIViewController {

    lazy var closeDialogButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.dismissDialog))

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if isModal {
            _ = addLeftBarButton(closeDialogButton)
        }

        let o1 = UIDevice.current.orientation
        let s1 = "Device: \(o1), is Portrait: \(o1.isPortrait), is Landscape: \(o1.isLandscape)"

        if (!isCurrentOrientationSupported()) {
            changeOrientation(preferredInterfaceOrientationForPresentation)
        }

        let o2 = UIDevice.current.orientation
        let s2 = "Device: \(o2), is Portrait: \(o2.isPortrait), is Landscape: \(o2.isLandscape)"

        print("\(s1) -> \(s2)")
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


