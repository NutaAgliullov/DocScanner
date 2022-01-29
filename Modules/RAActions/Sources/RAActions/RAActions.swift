import UIKit

public struct RAActions {
    public init() {}

    public func makeActionsViewController() -> UIViewController {
        let viewController = RAActionsViewController()
        let interactor = RAActionsInteractor()
        let presenter = RAActionsPresenter()
        let router = RAActionsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        viewController.view.setNeedsLayout()
        return viewController
    }
}
