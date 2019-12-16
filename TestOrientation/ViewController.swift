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


