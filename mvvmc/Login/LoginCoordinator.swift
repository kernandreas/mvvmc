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

    var dependencies: Services
    weak var coordinatedViewController: LoginViewController?
    weak var presentingViewController: UIViewController?


    weak var delegate: LoginCoordinatorDelegate?

    required init(presentingViewController: UIViewController?, inject: Services) {
        self.presentingViewController = presentingViewController
        self.dependencies = inject

    }


    func createViewController() -> LoginViewController? {
        let viewModel = LoginViewModel(coordinator: self, services: dependencies)
        return LoginViewController(viewModel: viewModel)
    }

    func showAfterLogin() {
        dismiss()
        delegate?.loginCoordinatorDidLogin(coordinator: self)
    }
}
