//
//  RAActionsViewController.swift
//  ActionsTestApp
//
//  Created by Раис Аглиуллов on 29.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit
import RAUI

protocol RAActionsDisplayLogic: AnyObject {
    func dislayNavigationTitle(viewModel: RAActionsModel.FetchNavigationTitle.ViewModel)
    func displayFetchedContent(viewModel: RAActionsModel.FetchContent.ViewModel)
    func displayTabbarItem(viewModel: RAActionsModel.SetupTabbarItem.ViewModel)
}

class RAActionsViewController: UIViewController {
    var interactor: RAActionsBusinessLogic?
    var router: (NSObjectProtocol & RAActionsRoutingLogic & RAActionsDataPassing)?
    
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
        
        collectionView.register(TestCell.self, forCellWithReuseIdentifier: String(describing: TestCell.self))
        
        return collectionView
    }()
    
    private var displayedSections: [RAActionsModel.DisplayedSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.frame = self.view.bounds
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.view.addSubview(self.collectionView)
        
        self.fetchNavigationTitle()
        self.setupTabbarItem()
        self.fetchContent()
    }
    
}

//MARK: - Interactor requests
extension RAActionsViewController {
    private func fetchNavigationTitle() {
        self.interactor?.fetchNavigationTitle()
    }
    
    private func setupTabbarItem() {
        self.interactor?.setupTabbarItem()
    }
    
    private func fetchContent() {
        let request = RAActionsModel.FetchContent.Request()
        self.interactor?.fetchContent(request: request)
    }
}

//MARK: - RAActionsDisplayLogic
extension RAActionsViewController: RAActionsDisplayLogic {
    func dislayNavigationTitle(viewModel: RAActionsModel.FetchNavigationTitle.ViewModel) {
        self.title = viewModel.title
    }
    
    func displayTabbarItem(viewModel: RAActionsModel.SetupTabbarItem.ViewModel) {
        let item = UITabBarItem(title: viewModel.title, image: viewModel.image, selectedImage: viewModel.selectedImage)
        self.tabBarItem = item
    }
    
    func displayFetchedContent(viewModel: RAActionsModel.FetchContent.ViewModel) {
        self.displayedSections = viewModel.sections
        self.collectionView.reloadData()
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension RAActionsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.displayedSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.displayedSections[section].cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellType = self.displayedSections[indexPath.section].cells[indexPath.item].type
        
        switch cellType {
        case .test(let title):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TestCell.self), for: indexPath) as! TestCell
            cell.setup(title: title)
            return cell
        }
    }
}
