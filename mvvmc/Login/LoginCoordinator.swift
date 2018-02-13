//
//  LoginCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

protocol LoginCoordinatorDelegate: class {
    func loginCoordinatorDidLogin(coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator {

    weak var viewController: LoginViewController?
    weak var root: UIViewController?

    let services: Services
    weak var delegate: LoginCoordinatorDelegate?

    init(root: UIViewController, services: Services) {
        self.root = root
        self.services = services
    }

    func createViewController() -> LoginViewController {
        let viewModel = LoginViewModel(coordinator: self, services: services)
        return LoginViewController(viewModel: viewModel)
    }

    func showAfterLogin() {
        dismiss()
        delegate?.loginCoordinatorDidLogin(coordinator: self)
    }
}
