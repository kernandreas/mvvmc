//
//  AppCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 11.02.18.
//

import UIKit

class AppCoordinator: Coordinator {

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() {
        coordinate(to: MainCoordinator(window: window))
        window.makeKeyAndVisible()
    }
}
