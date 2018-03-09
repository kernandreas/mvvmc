//
//  AppCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 11.02.18.
//

import UIKit

class AppCoordinator: Coordinator {

    var dependencies: Services
    weak var coordinatedViewController: UIViewController?
    weak var presentingViewController: UIViewController?

    var services: Services { return self.dependencies }

    private let window: UIWindow = UIWindow()


    required init(presentingViewController: UIViewController?, inject: Services) {
        dependencies = inject
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
        let coordinator = LoginCoordinator(presentingViewController: navigationController, inject: dependencies)
        coordinator.delegate = self
        coordinator.show()

        return navigationController
    }

    func createTabbarController() -> UITabBarController {
        let tabBarController = UITabBarController()

        let firstNavigationController = UINavigationController()
        let firstCoordinator = FirstCoordinator(presentingViewController: firstNavigationController, inject: true)
        firstCoordinator.show()

        let secondNavigationController = UINavigationController()
        let secondCoordinator = SecondCoordinator(presentingViewController: secondNavigationController, inject: services)
        secondCoordinator.show()

        tabBarController.viewControllers = [
            firstNavigationController,
            secondNavigationController
        ]

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
