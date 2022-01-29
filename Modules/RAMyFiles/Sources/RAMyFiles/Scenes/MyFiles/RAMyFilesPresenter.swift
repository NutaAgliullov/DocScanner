//
//  RAMyFilesPresenter.swift
//  MyFilesTestApp
//
//  Created by Раис Аглиуллов on 22.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

protocol RAMyFilesPresentationLogic {
    func presentNavigationTitle()
    func presentTabbarItem()
    func presentFetchedContent(response: RAMyFilesModel.FetchContent.Response)
}

class RAMyFilesPresenter {
    weak var viewController: RAMyFilesDisplayLogic?
    
    private func getAddFileSection() -> RAMyFilesModel.DisplayedSection {
        let cell = RAMyFilesModel.DisplayedSection.DisplayedCell(type: .addFile(title: "Add files"))
        let section = RAMyFilesModel.DisplayedSection(type: .addFile, header: nil, footer: nil, cells: [cell])
        return section
    }
    
    private func getFilesSection() -> RAMyFilesModel.DisplayedSection {
        var cells: [RAMyFilesModel.DisplayedSection.DisplayedCell] = []
        
        for (_, index) in (1...20).enumerated() {
            let cell = RAMyFilesModel.DisplayedSection.DisplayedCell(type: .file(title: "\(index)", imageName: "person.badge.plus"))
            cells.append(cell)
        }
        let section = RAMyFilesModel.DisplayedSection(type: .files, header: nil, footer: nil, cells: cells)
        return section
    }
    
    private func getSections() -> [RAMyFilesModel.DisplayedSection] {
        var sections: [RAMyFilesModel.DisplayedSection] = []
        
        //AddFile section
        sections.append(self.getAddFileSection())
        
        //Files section
        sections.append(self.getFilesSection())
        
        return sections
    }
    
}

//MARK: - RAMyFilesPresentationLogic
extension RAMyFilesPresenter: RAMyFilesPresentationLogic {
    func presentTabbarItem() {
        let title: String = "My files"
        let image: UIImage? = UIImage.init(systemName: "tray.full")
        let selectedImage: UIImage? = UIImage.init(systemName: "tray.full.fill")
        
        let viewModel = RAMyFilesModel.SetupTabbarItem.ViewModel(title: title, image: image, selectedImage: selectedImage)
        self.viewController?.displayTabbarItem(viewModel: viewModel)
    }
    
    func presentNavigationTitle() {
        let title: String = "Doc scanner ☭"
        let viewModel = RAMyFilesModel.FetchNavigationTitle.ViewModel(title: title)
        self.viewController?.dislayNavigationTitle(viewModel: viewModel)
    }
    
    func presentFetchedContent(response: RAMyFilesModel.FetchContent.Response) {
        let sections = self.getSections()
        let viewModel = RAMyFilesModel.FetchContent.ViewModel(sections: sections)
        self.viewController?.displayFetchedContent(viewModel: viewModel)
    }
}
