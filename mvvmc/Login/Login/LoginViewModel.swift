//
//  LoginViewModel.swift
//  mvvmc
//
//  Created by Andreas Kern on 08.02.18.
//

import Foundation

protocol LoginViewModelCoordinationDelegate: class {
    func loginViewModelDidLogin(_ viewModel: LoginViewModel)
    func loginViewModelWantsRegister(_ viewModel: LoginViewModel)
}

class LoginViewModel {

    weak var delegate: LoginViewModelCoordinationDelegate?

    func authenticate() {
        delegate?.loginViewModelDidLogin(self)
    }

    func register() {
        delegate?.loginViewModelWantsRegister(self)
    }
}
