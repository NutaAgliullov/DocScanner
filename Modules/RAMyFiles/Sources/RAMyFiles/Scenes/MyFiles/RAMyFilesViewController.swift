//
//  RAMyFilesViewController.swift
//  MyFilesTestApp
//
//  Created by Раис Аглиуллов on 22.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

protocol RAMyFilesDisplayLogic: AnyObject {
    func displayInitialSetup(viewModel: RAMyFilesModel.InitialSetup.ViewModel)
    func displayFetchedContent(viewModel: RAMyFilesModel.FetchContent.ViewModel)
}

class RAMyFilesViewController: UIViewController {
    var interactor: RAMyFilesBusinessLogic?
    var router: (RAMyFilesRoutingLogic & RAMyFilesDataPassing)?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16.0
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: layout.minimumInteritemSpacing, bottom: 16.0, right: layout.minimumInteritemSpacing)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.secondarySystemBackground
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.bounces = true
        collectionView.alwaysBounceVertical = true
        collectionView.alwaysBounceHorizontal = false
        
        collectionView.register(AddFileCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: AddFileCollectionViewCell.self))
        collectionView.register(FileCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: FileCollectionViewCell.self))
        
        return collectionView
    }()
    
    private var displayedSections: [RAMyFilesModel.DisplayedSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.collectionView)
        self.collectionView.frame = self.view.bounds
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.initialSetup()
        self.fetchContent()
    }
    
    //MARK: - Interactor requests
    private func initialSetup() {
        let request = RAMyFilesModel.InitialSetup.Request()
        self.interactor?.initialSetup(request: request)
    }
    
    private func fetchContent() {
        let request = RAMyFilesModel.FetchContent.Request()
        self.interactor?.fetchContent(request: request)
    }
}

//MARK: - RAMyFilesDisplayLogic
extension RAMyFilesViewController: RAMyFilesDisplayLogic {
    func displayInitialSetup(viewModel: RAMyFilesModel.InitialSetup.ViewModel) {
        //self.view.backgroundColor = UIColor.red
    }
    
    func displayFetchedContent(viewModel: RAMyFilesModel.FetchContent.ViewModel) {
        self.displayedSections = viewModel.sections
        self.collectionView.reloadData()
    }

}

//MARK: - Layout helpers
extension RAMyFilesViewController {
    private func getAddFileCellSize(title: String) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = AddFileCollectionViewCell.getCellHeight(title: title, width: width)
        return CGSize(width: width, height: height)
    }
    
    private func getFileCellSize(title: String) -> CGSize {
        guard let fileSectionIndex = self.displayedSections.firstIndex(where: {$0.type == .files}) else { return .zero }
        let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let insets = layout?.sectionInset ?? .zero
        let itemSpacing = layout?.minimumLineSpacing ?? 0
        let numberOfColumn = CGFloat(self.displayedSections[fileSectionIndex].cells.count % 2) + 2
        let width = (collectionView.frame.width - insets.left - insets.right - itemSpacing * (numberOfColumn - 1)) / numberOfColumn
        let height: CGFloat = FileCollectionViewCell.getCellHeight(title: title, width: width)
        return CGSize(width: width, height: height)
    }
}

//MARK: -
extension RAMyFilesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.displayedSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.displayedSections[section].cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = self.displayedSections[indexPath.section].cells[indexPath.item].type
        
        switch cellType {
        case .addFile(let title):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AddFileCollectionViewCell.self), for: indexPath) as! AddFileCollectionViewCell
            cell.setup(title: title)
            return cell
        case .file(let title, let imageName):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FileCollectionViewCell.self), for: indexPath) as! FileCollectionViewCell
            cell.setup(title: title, imageName: imageName)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellType = self.displayedSections[indexPath.section].cells[indexPath.item].type

        switch cellType {
        case .addFile(let title):
            return self.getAddFileCellSize(title: title)
        case .file(let title, _):
            return self.getFileCellSize(title: title)
        }
    }

}
