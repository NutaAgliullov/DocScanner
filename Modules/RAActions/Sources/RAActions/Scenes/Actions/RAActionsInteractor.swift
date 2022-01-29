//
//  RAActionsInteractor.swift
//  ActionsTestApp
//
//  Created by Раис Аглиуллов on 29.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

protocol RAActionsBusinessLogic {
    func fetchNavigationTitle()
    func setupTabbarItem()
    func fetchContent(request: RAActionsModel.FetchContent.Request)
}

protocol RAActionsDataStore {
    //var name: String { get set }
}

class RAActionsInteractor: RAActionsDataStore {
    var presenter: RAActionsPresentationLogic?
    var worker: RAActionsWorker?
}

//MARK: - RAActionsBusinessLogic
extension RAActionsInteractor: RAActionsBusinessLogic {
    func setupTabbarItem() {
        self.presenter?.presentTabbarItem()
    }
    
    func fetchNavigationTitle() {
        self.presenter?.presentNavigationTitle()
    }
    
    func fetchContent(request: RAActionsModel.FetchContent.Request) {
        let response = RAActionsModel.FetchContent.Response()
        self.presenter?.presentFetchedContent(response: response)
    }
}
