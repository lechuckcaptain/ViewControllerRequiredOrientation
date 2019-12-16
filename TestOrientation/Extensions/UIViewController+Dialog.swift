import Foundation
import UIKit

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

