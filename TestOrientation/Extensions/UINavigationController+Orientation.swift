import Foundation
import UIKit

extension UINavigationController {

    override open var shouldAutorotate: Bool {
        let sa = topViewController?.shouldAutorotate ?? super.shouldAutorotate
        print("Orientation - '\(self.typeName)' shouldAutorotate: \(sa)")
        return sa
    }

    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        let sio = topViewController?.supportedInterfaceOrientations ?? super.supportedInterfaceOrientations
        print("Orientation - '\(self.typeName)' supportedInterfaceOrientations: \(sio)")
        return sio
    }

    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        let v = topViewController?.preferredInterfaceOrientationForPresentation ?? super.preferredInterfaceOrientationForPresentation
        print("Orientation - '\(self.typeName)' preferredInterfaceOrientationForPresentation: \(v)")
        return v
    }
}
