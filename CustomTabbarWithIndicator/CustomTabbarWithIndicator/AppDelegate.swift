//
//  AppDelegate.swift
//  CustomTabbarWithIndicator
//
//  Created by Krupanshu Sharma on 08/12/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window?.rootViewController = MainTabbarController()
        window?.makeKeyAndVisible()
        return true
    }
}

