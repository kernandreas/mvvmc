//
//  SecondCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class SecondCoordinator: Coordinator {

    let rootViewController: UINavigationController

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }

    func start() {
        let viewModel = SecondViewModel()

        viewModel.showNext = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.coordinate(to: SecondCoordinator(rootViewController: strongSelf.rootViewController))
        }

        viewModel.goBack = { [weak self] in
            self?.rootViewController.popViewController(animated: true)
        }

        guard let viewController = UIStoryboard(name: "SecondStoryboard", bundle: nil).instantiateInitialViewController() as? SecondViewController else {
            return
        }
        viewController.viewModel = viewModel
        rootViewController.show(viewController, sender: nil)
    }
}
