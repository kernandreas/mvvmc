//
//  MainCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 09.03.18.
//

import UIKit

class MainCoordinator: Coordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let tabBarController = UITabBarController()

        let firstNavigationController = UINavigationController()
        coordinate(to: FirstCoordinator(rootViewController: firstNavigationController))

        let secondNavigationController = UINavigationController()
        coordinate(to: SecondCoordinator(rootViewController: secondNavigationController))

        tabBarController.viewControllers = [
            firstNavigationController,
            secondNavigationController
        ]

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
