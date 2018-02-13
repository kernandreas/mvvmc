//
//  SecondCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class SecondCoordinator: Coordinator {

    weak var viewController: SecondViewController?
    weak var root: UIViewController?

    init(root: UIViewController) {
        self.root = root
    }

    func createViewController() -> SecondViewController? {
        guard let vc = UIStoryboard(name: "SecondStoryboard", bundle: nil).instantiateInitialViewController() as? SecondViewController else { return nil }
        vc.viewModel = SecondViewModel(coordinator: self)
        return vc
    }
}
