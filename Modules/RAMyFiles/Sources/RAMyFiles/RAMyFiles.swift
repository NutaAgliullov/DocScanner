import UIKit

public struct RAMyFiles {
    public static func makeMyFilesViewController() -> UIViewController {
        let viewController = RAMyFilesViewController()
        let interactor = RAMyFilesInteractor()
        let presenter = RAMyFilesPresenter()
        let router = RAMyFilesRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}
