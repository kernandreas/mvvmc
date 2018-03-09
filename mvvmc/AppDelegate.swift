//
//  AppDelegate.swift
//  mvvmc
//
//  Created by Andreas Kern on 08.02.18.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()

        coordinator = window.map(AppCoordinator.init)
        coordinator?.start()

        return true
    }
}

