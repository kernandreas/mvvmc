//
//  LoginViewModel.swift
//  mvvmc
//
//  Created by Andreas Kern on 08.02.18.
//

import Foundation

class LoginViewModel {

    private let authenticationService: AuthenticationService

    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }

    func authenticate(username: String, password: String, result: (Bool) -> ()) {
        authenticationService.authenticate(username: username, password: password, result: result)
    }
}
