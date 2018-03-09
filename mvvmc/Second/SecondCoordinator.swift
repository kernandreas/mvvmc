//
//  SecondCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class SecondCoordinator: Coordinator {

    let tabBarController: UITabBarController

    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }

    func start() {
        let viewModel = SecondViewModel()
        guard let viewController = UIStoryboard(name: "SecondStoryboard", bundle: nil).instantiateInitialViewController() as? SecondViewController else {
            return
        }
        viewController.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: viewController)

        tabBarController.viewControllers = (tabBarController.viewControllers ?? []) + [navigationController]
    }
}
