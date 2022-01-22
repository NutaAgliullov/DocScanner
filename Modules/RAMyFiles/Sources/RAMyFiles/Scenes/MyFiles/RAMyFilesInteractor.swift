//
//  RAMyFilesInteractor.swift
//  MyFilesTestApp
//
//  Created by Раис Аглиуллов on 22.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

protocol RAMyFilesBusinessLogic {
    func initialSetup(request: RAMyFilesModel.InitialSetup.Request)
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
    func initialSetup(request: RAMyFilesModel.InitialSetup.Request) {
        let response = RAMyFilesModel.InitialSetup.Response()
        self.presenter?.presentInitialSetup(response: response)
    }
    
    func fetchContent(request: RAMyFilesModel.FetchContent.Request) {
        let response = RAMyFilesModel.FetchContent.Response()
        self.presenter?.presentFetchedContent(response: response)
    }
}
