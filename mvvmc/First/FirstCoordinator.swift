//
//  FirstCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class FirstCoordinator: Coordinator {

    let rootViewController: UIViewController

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func start() {
        let viewModel = FirstViewModel()
        let viewController = FirstViewController(viewModel: viewModel)
        rootViewController.show(viewController, sender: nil)
    }
}
