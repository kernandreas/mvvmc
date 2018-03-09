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

    override func start() {
        let tabBarController = UITabBarController()
        coordinate(to: FirstCoordinator(tabBarController: tabBarController))
        coordinate(to: SecondCoordinator(tabBarController: tabBarController))
        window.rootViewController = tabBarController
    }
}
