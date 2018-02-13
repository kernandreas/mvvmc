//
//  AppCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 11.02.18.
//

import UIKit

class AppCoordinator {

    private let services: Services
    private let window: UIWindow = UIWindow()
    private lazy var tabBarController = UITabBarController()

    init(services: Services) {
        self.services = services
    }

    func start() {

        if services.authentification.isLoggedIn {
            window.rootViewController = tabBarController
        } else {
            let navigationController = UINavigationController()
            window.rootViewController = navigationController

            let coordinator = LoginCoordinator(root: navigationController, services: services)
            coordinator.delegate = self
            coordinator.show()
        }

        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {

    func loginCoordinatorDidLogin(coordinator: LoginCoordinator) {
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.start()
        }
    }
}
