//
//  FirstCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class FirstCoordinator: Coordinator {

    let tabBarController: UITabBarController

    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }

    func start() {
        let viewModel = FirstViewModel()
        let viewController = FirstViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        tabBarController.viewControllers = (tabBarController.viewControllers ?? []) + [navigationController]
    }
}
