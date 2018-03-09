//
//  FirstCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class FirstCoordinator: Coordinator{

    var dependencies: Bool
    weak var coordinatedViewController: FirstViewController?
    weak var presentingViewController: UIViewController?


    required init(presentingViewController: UIViewController?, inject: Bool) {
        self.presentingViewController = presentingViewController
        self.dependencies = inject
    }

    func createViewController() -> FirstViewController? {
        let viewModel = FirstViewModel(coordinator: self)
        return FirstViewController(viewModel: viewModel)
    }
}
