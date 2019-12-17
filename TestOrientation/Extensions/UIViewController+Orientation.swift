import Foundation
import UIKit

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

    func changeOrientation(_ orientation: UIDeviceOrientation) {
        print("Change orientation: \(orientation)")
        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
    }

    func changeOrientation(_ orientation: UIInterfaceOrientation) {
        print("Change orientation: \(orientation)")
        UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
    }
}
