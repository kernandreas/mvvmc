//
//  LoginViewModel.swift
//  mvvmc
//
//  Created by Andreas Kern on 08.02.18.
//

import Foundation

class LoginViewModel {

    private let coordinator: LoginCoordinator
    private let services: Services

    init(coordinator: LoginCoordinator, services: Services) {
        self.coordinator = coordinator
        self.services = services
    }

    func authenticate(username: String, password: String, result: (Bool) -> ()) {
        services.authentification.authenticate(username: username, password: password, result: result)
    }
}
