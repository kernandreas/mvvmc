//
//  LoginCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class LoginCoordinator: Coordinator {

    var viewController: LoginViewController?
    let root: UIViewController

    let services: Services

    init(root: UIViewController, services: Services) {
        self.root = root
        self.services = services
    }

    func createViewController() -> LoginViewController {
        let viewModel = LoginViewModel(coordinator: self, services: services)
        return LoginViewController(viewModel: viewModel)
    }

    deinit {
        print("deninit \(self)")
    }
}
