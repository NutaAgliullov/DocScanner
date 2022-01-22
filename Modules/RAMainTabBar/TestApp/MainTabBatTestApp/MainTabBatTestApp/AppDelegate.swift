//
//  AppDelegate.swift
//  MainTabBatTestApp
//
//  Created by Раис Аглиуллов on 22.01.2022.
//

import UIKit
import RAMainTabBar

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainTabBarVC = RAMainTabBar.makeMainTabBarController()
        self.window?.rootViewController = mainTabBarVC
        self.window?.makeKeyAndVisible()
        return true
    }
}

