//
//  AppDelegate.swift
//  DocScanner
//
//  Created by Раис Аглиуллов on 17.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainTabBarVC = MainTabBarViewController()
        self.window?.rootViewController = mainTabBarVC
        self.window?.makeKeyAndVisible()
        return true
    }
}

