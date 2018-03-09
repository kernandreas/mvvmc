//
//  SecondCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class SecondCoordinator: Coordinator {


    var dependencies: Services

    required init(presentingViewController: UIViewController?, inject: Services) {
        self.presentingViewController = presentingViewController
        self.dependencies = inject
    }

    weak var coordinatedViewController: SecondViewController?
    weak var presentingViewController: UIViewController?


    func createViewController() -> SecondViewController? {
        guard let vc = UIStoryboard(name: "SecondStoryboard", bundle: nil).instantiateInitialViewController() as? SecondViewController else { return nil }
        vc.viewModel = SecondViewModel(coordinator: self)
        return vc
    }
}
