//
//  RAMyFilesInteractor.swift
//  MyFilesTestApp
//
//  Created by Раис Аглиуллов on 22.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

protocol RAMyFilesBusinessLogic {
    func fetchNavigationTitle()
    func setupTabbarItem()
    func fetchContent(request: RAMyFilesModel.FetchContent.Request)
}

protocol RAMyFilesDataStore {
    //var name: String { get set }
}

class RAMyFilesInteractor: RAMyFilesDataStore {
    var presenter: RAMyFilesPresentationLogic?
    var worker: RAMyFilesWorker?
}

//MARK: - RAMyFilesBusinessLogic
extension RAMyFilesInteractor: RAMyFilesBusinessLogic {
    func setupTabbarItem() {
        self.presenter?.presentTabbarItem()
    }
    
    func fetchNavigationTitle() {
        self.presenter?.presentNavigationTitle()
    }
    
    func fetchContent(request: RAMyFilesModel.FetchContent.Request) {
        let response = RAMyFilesModel.FetchContent.Response()
        self.presenter?.presentFetchedContent(response: response)
    }
}
