import Foundation

extension NSObject {
    internal var typeName: String {
        return String(describing: type(of: self))
    }
}
