//
//  AppDelegate.swift
//  mvvmc
//
//  Created by Andreas Kern on 08.02.18.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy private var coordinator = AppCoordinator()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = coordinator.window
        coordinator.start()

        return true
    }
}

