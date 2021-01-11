

import UIKit

protocol Coordinator {
    func start()
    var childCoordinators:[Coordinator] {get set}
    var parentCoordinator:Coordinator? {get set}
    
}



protocol NavigationCoordinator:Coordinator, UINavigationControllerDelegate {
    var root: UINavigationController {get}
}



