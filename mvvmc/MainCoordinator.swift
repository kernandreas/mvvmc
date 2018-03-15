//
//  MainCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 09.03.18.
//

import UIKit

class MainCoordinator: Coordinator {

    let tabBarController = UITabBarController()

    func start() {

        // Span other child coordinators instead just init the VCs!!

        let vc = UIViewController()
        vc.title = "FIRST"
        vc.view.backgroundColor = .blue

        let vc2 = UIViewController()
        vc2.title = "SECOND"
        vc2.view.backgroundColor = .red

        tabBarController.viewControllers = [vc, vc2]
    }
}
