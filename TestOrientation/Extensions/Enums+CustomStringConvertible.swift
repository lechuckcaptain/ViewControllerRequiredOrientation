import Foundation
import UIKit

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
