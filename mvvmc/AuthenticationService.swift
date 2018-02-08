//
// Created by Andreas Kern on 08.02.18.
//

import Foundation

protocol AuthenticationService {
    func authenticate(username: String, password: String, result: (Bool) -> ())
}

class BackendAuthenticationService: AuthenticationService {
    func authenticate(username: String, password: String, result: (Bool) -> ()) {
        // In a real application we would make a call to the backend
        let valid = [("userA", "passwordA"), ("userB", "passwordB")]
        let isValid = valid.contains { (candidate) -> Bool in
            return candidate.0 == username && candidate.1 == password
        }
        result(isValid)
    }
}
