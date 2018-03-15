//
//  AppCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 11.02.18.
//

import UIKit

class AppCoordinator: Coordinator {
    let window = UIWindow()
    var isLoggedIn = false

    func start() {
        isLoggedIn ? showMain() : showLogin()
        window.makeKeyAndVisible()
    }

    func showLogin() {
        let coordinator = LoginCoordinator()
        addChild(coordinator)
        coordinator.delegate = self
        window.rootViewController = coordinator.navigationController
        coordinator.start()
    }

    func showMain() {
        let coordinator = MainCoordinator()
        addChild(coordinator)
        window.rootViewController = coordinator.tabBarController
        coordinator.start()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func loginCoordinatorDidFinish(_ coordinator: LoginCoordinator) {
        isLoggedIn = true
        removeChild(coordinator)
        showMain()
    }
}
