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

    func createViewController() -> UIViewController? {
        if services.authentification.isLoggedIn {
            return createTabbarController()
        } else {
            return createLoginViewController()
        }
    }

    func createLoginViewController() -> UIViewController {
        let navigationController = UINavigationController()
        let coordinator = LoginCoordinator(root: navigationController, services: services)
        coordinator.delegate = self
        coordinator.show()

        return navigationController
    }

    func createTabbarController() -> UITabBarController {
        let tabBarController = UITabBarController()

        let firstNavigationController = UINavigationController()
        let firstCoordinator = FirstCoordinator(root: firstNavigationController)

        let secondNavigationController = UINavigationController()
        let secondCoordinator = SecondCoordinator(root: secondNavigationController)

        tabBarController.viewControllers = [
            firstNavigationController,
            secondNavigationController
        ]

        firstCoordinator.show()
        secondCoordinator.show()

        return tabBarController
    }

    func show() {
        let vc = createViewController()
        vc?.view.frame = window.bounds
        UIView.animate(withDuration: 0.3, animations: { [unowned self] in
            self.window.rootViewController = vc
        })

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
        show()
    }
}
