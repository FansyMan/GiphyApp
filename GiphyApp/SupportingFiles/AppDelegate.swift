//
//  AppDelegate.swift
//  GiphyApp
//
//  Created by Surgeont on 12.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SearchViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

    
}

