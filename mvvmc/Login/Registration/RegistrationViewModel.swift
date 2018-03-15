//
//  RegistrationViewModel.swift
//  mvvmc
//
//  Created by Andreas Kern on 15.03.18.
//

import Foundation

protocol RegistrationViewModelCoordinationDelegate: class {
    func registrationViewModelDidRegister(_ viewModel: RegistrationViewModel)
}

class RegistrationViewModel {

    weak var delegate: RegistrationViewModelCoordinationDelegate?

    var username: String? {
        didSet {
            canRegister.value = username.map({ $0.isEmpty }) == false && password.map({ $0.isEmpty }) == false
        }
    }

    var password: String? {
        didSet {
            canRegister.value = username.map({ $0.isEmpty }) == false && password.map({ $0.isEmpty }) == false
        }
    }

    var canRegister = Observable<Bool>(false)

    func register() {
        delegate?.registrationViewModelDidRegister(self)
    }
}
