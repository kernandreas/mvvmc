//
//  LoginCoordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

protocol LoginCoordinatorDelegate: class {
    func loginCoordinatorDidFinish(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator {

    let navigationController = UINavigationController()
    weak var delegate: LoginCoordinatorDelegate?

    func start() {
        let viewModel = LoginViewModel()
        viewModel.delegate = self
        let loginVC = LoginViewController(viewModel: viewModel)
        navigationController.viewControllers = [loginVC]
    }

    func showRegistration() {
        let regVC = UIViewController()
        navigationController.pushViewController(regVC, animated: true)
    }
}

extension LoginCoordinator: LoginViewModelCoordinationDelegate {
    func loginViewModelDidLogin(_ viewModel: LoginViewModel) {
        delegate?.loginCoordinatorDidFinish(self)
    }

    func loginViewModelWantsRegister(_ viewModel: LoginViewModel) {
        let registerVM = RegistrationViewModel()
        registerVM.delegate = self
        let registerVC = RegistrationViewController(viewModel: registerVM)
        navigationController.pushViewController(registerVC, animated: true)
    }
}

extension LoginCoordinator: RegistrationViewModelCoordinationDelegate {
    func registrationViewModelDidRegister(_ viewModel: RegistrationViewModel) {
        delegate?.loginCoordinatorDidFinish(self)
    }
}
