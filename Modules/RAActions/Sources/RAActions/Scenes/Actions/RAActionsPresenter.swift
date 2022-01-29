//
//  RAActionsPresenter.swift
//  ActionsTestApp
//
//  Created by Раис Аглиуллов on 29.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

protocol RAActionsPresentationLogic {
    func presentNavigationTitle()
    func presentTabbarItem()
    func presentFetchedContent(response: RAActionsModel.FetchContent.Response)}

class RAActionsPresenter {
    weak var viewController: RAActionsDisplayLogic?
    
    private func getSections() -> [RAActionsModel.DisplayedSection] {
        var cells: [RAActionsModel.DisplayedSection.DisplayedCell] = []
        
        for (_, index) in (1...20).enumerated() {
            let cell = RAActionsModel.DisplayedSection.DisplayedCell(type: .test(title: "\(index)"))
            cells.append(cell)
        }
        let section = RAActionsModel.DisplayedSection(type: .test, header: nil, footer: nil, cells: cells)
        return [section]
    }
}

//MARK: - RAActionsPresentationLogic
extension RAActionsPresenter: RAActionsPresentationLogic {
    func presentTabbarItem() {
        let title: String = "Actions"
        let image: UIImage? = UIImage.init(systemName: "square.grid.2x2")
        let selectedImage: UIImage? = UIImage.init(systemName: "square.grid.2x2.fill")
        
        let viewModel = RAActionsModel.SetupTabbarItem.ViewModel(title: title, image: image, selectedImage: selectedImage)
        self.viewController?.displayTabbarItem(viewModel: viewModel)
    }
    
    func presentNavigationTitle() {
        let title: String = "Actions ⚛︎"
        let viewModel = RAActionsModel.FetchNavigationTitle.ViewModel(title: title)
        self.viewController?.dislayNavigationTitle(viewModel: viewModel)
    }
    
    func presentFetchedContent(response: RAActionsModel.FetchContent.Response) {
        let sections = self.getSections()
        let viewModel = RAActionsModel.FetchContent.ViewModel(sections: sections)
        self.viewController?.displayFetchedContent(viewModel: viewModel)
    }
}
