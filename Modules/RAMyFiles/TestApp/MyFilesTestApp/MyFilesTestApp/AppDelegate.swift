//
//  AppDelegate.swift
//  MyFilesTestApp
//
//  Created by Раис Аглиуллов on 22.01.2022.
//

import UIKit
import RAMyFiles

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let myFilesVC = RAMyFiles.makeMyFilesViewController()
        self.window?.rootViewController = myFilesVC
        self.window?.makeKeyAndVisible()
        return true
    }

}

