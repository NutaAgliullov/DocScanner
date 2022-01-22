//
//  MainTabBarInteractor.swift
//  MainTabBatTestApp
//
//  Created by Раис Аглиуллов on 22.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

protocol MainTabBarBusinessLogic {
    func initialSetup(request: MainTabBarModel.InitialSetup.Request)
}

protocol MainTabBarDataStore {
}

class MainTabBarInteractor: MainTabBarDataStore {
    var presenter: MainTabBarPresentationLogic?
    var worker: MainTabBarWorker?
    
}

extension MainTabBarInteractor: MainTabBarBusinessLogic {
    func initialSetup(request: MainTabBarModel.InitialSetup.Request) {
       
    }
}
