//
//  MainTabBarPresenter.swift
//  MainTabBatTestApp
//
//  Created by Раис Аглиуллов on 22.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

protocol MainTabBarPresentationLogic {
    func presentInitialSetup(response: MainTabBarModel.InitialSetup.Response)
}

class MainTabBarPresenter {
    weak var viewController: MainTabBarDisplayLogic?
    
}

extension MainTabBarPresenter: MainTabBarPresentationLogic {
    func presentInitialSetup(response: MainTabBarModel.InitialSetup.Response)  {
       
    }
}

