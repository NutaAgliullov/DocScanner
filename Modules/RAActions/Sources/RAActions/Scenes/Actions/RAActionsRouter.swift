//
//  RAActionsRouter.swift
//  ActionsTestApp
//
//  Created by Раис Аглиуллов on 29.01.2022.
//  Copyright (c) 2022 Раис Аглиуллов. All rights reserved.

import UIKit

@objc protocol RAActionsRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol RAActionsDataPassing {
    var dataStore: RAActionsDataStore? { get }
}

class RAActionsRouter: NSObject, RAActionsRoutingLogic, RAActionsDataPassing {
    
    weak var viewController: RAActionsViewController?
    var dataStore: RAActionsDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: RAActionsViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: RAActionsDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
