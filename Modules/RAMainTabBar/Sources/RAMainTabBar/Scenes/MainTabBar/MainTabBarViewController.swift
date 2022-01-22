//
//  MainTabBarViewController.swift
//  MainTabBatTestApp
//
//  Created by Раис Аглиуллов on 22.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

protocol MainTabBarDisplayLogic: AnyObject {
    func displayInitialSetup(viewModel: MainTabBarModel.InitialSetup.ViewModel)
}

class MainTabBarViewController: UITabBarController {
    var interactor: MainTabBarBusinessLogic?
    var router: (NSObjectProtocol & MainTabBarRoutingLogic & MainTabBarDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Interactor request
    private func initialSetup() {
        let request = MainTabBarModel.InitialSetup.Request()
        self.interactor?.initialSetup(request: request)
    }
}

extension MainTabBarViewController: MainTabBarDisplayLogic {
    func displayInitialSetup(viewModel: MainTabBarModel.InitialSetup.ViewModel) {
        self.view.backgroundColor = UIColor.systemGray2
    }
}
