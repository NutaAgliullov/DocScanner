//
//  MainTabBarViewController.swift
//  MainTabBatTestApp
//
//  Created by Раис Аглиуллов on 22.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit
import RAMyFiles
import RAActions
import RAUI

class MainTabBarViewController: UITabBarController {
    
    private let myFilesModule: RAMyFiles = {
        let module = RAMyFiles()
        return module
    }()
    
    private let actionsModule: RAActions = {
        let module = RAActions()
        return module
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.addControllers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addControllers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
            
        self.setupTabbar()
    }
    
    private func addControllers() {
        var viewControllers: [UIViewController] = self.viewControllers ?? []
        let myFilesVC = self.getMyFilesVC()
        let actionsVC = self.getActionsVC()
        viewControllers.append(contentsOf: [myFilesVC, actionsVC])
        self.viewControllers = viewControllers
    }
    
    private func setupTabbar() {
        self.tabBar.layer.borderWidth = 0.3
        self.tabBar.layer.borderColor = UIColor.raGray.cgColor
        self.tabBar.clipsToBounds = true
        self.tabBar.tintColor = UIColor.black
    }
}

//MARK: - RAMyFiles module
extension MainTabBarViewController {
    private func getMyFilesVC() -> UIViewController {
        let myFilesVC = self.myFilesModule.makeMyFilesViewController()
        let navigationVC = UINavigationController(rootViewController: myFilesVC)
        return navigationVC
    }
}

//MARK: - RAActions module
extension MainTabBarViewController {
    private func getActionsVC() -> UIViewController {
        let actionsVC = self.actionsModule.makeActionsViewController()
        let navigationVC = UINavigationController(rootViewController: actionsVC)
        return navigationVC
    }
}

extension MainTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
