import UIKit

public struct RAMainTabBar {
    public static func makeMainTabBarController() -> UITabBarController {
        let viewController = MainTabBarViewController()
        let interactor = MainTabBarInteractor()
        let presenter = MainTabBarPresenter()
        let router = MainTabBarRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}
