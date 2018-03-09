//
//  SecondCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class SecondCoordinator: Coordinator {

    let rootViewController: UIViewController

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func start() {
        let viewModel = SecondViewModel()

        viewModel.showNext = { [unowned self] in
            self.coordinate(to: SecondCoordinator(rootViewController: self.rootViewController))
        }

        guard let viewController = UIStoryboard(name: "SecondStoryboard", bundle: nil).instantiateInitialViewController() as? SecondViewController else {
            return
        }
        viewController.viewModel = viewModel
        rootViewController.show(viewController, sender: nil)
    }
}
