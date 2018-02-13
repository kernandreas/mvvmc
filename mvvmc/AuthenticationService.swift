//
// Created by Andreas Kern on 08.02.18.
//

import Foundation

protocol AuthenticationService {
    var isLoggedIn: Bool { get }
    func authenticate(username: String, password: String, result: (Bool) -> ())
}

class BackendAuthenticationService: AuthenticationService {

    var isLoggedIn = false

    func authenticate(username: String, password: String, result: (Bool) -> ()) {
        isLoggedIn = true
        result(true)
    }
}
