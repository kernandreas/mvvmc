//
//  FirstCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class FirstCoordinator: Coordinator {

    weak var viewController: FirstViewController?
    weak var root: UIViewController?

    init(root: UIViewController) {
        self.root = root
    }

    func createViewController() -> FirstViewController {
        let viewModel = FirstViewModel(coordinator: self)
        return FirstViewController(viewModel: viewModel)
    }
}
