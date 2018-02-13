//
//  AppCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 11.02.18.
//

import UIKit

class AppCoordinator: Coordinator {

    weak var viewController: UIViewController?
    weak var root: UIViewController?

    private let services: Services
    private let window: UIWindow = UIWindow()

    init(services: Services) {
        self.services = services
    }

    func createViewController() -> UIViewController {
        if services.authentification.isLoggedIn {
            let tabBarController = UITabBarController()
            return tabBarController
        } else {
            let navigationController = UINavigationController()
            let coordinator = LoginCoordinator(root: navigationController, services: services)
            coordinator.delegate = self
            coordinator.show()

            return navigationController
        }
    }

    func show() {
        viewController = createViewController()
        window.rootViewController = viewController

        if !window.isKeyWindow {
            window.makeKeyAndVisible()
        }
    }

    func dismiss() {
        window.rootViewController = nil
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {

    func loginCoordinatorDidLogin(coordinator: LoginCoordinator) {
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.show()
        }
    }
}
