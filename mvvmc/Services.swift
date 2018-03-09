//
//  Services.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import Foundation

protocol Services: Dependencies {
    var authentification: AuthenticationService { get }
}

struct AppServices: Services {
    let authentification: AuthenticationService = BackendAuthenticationService()
}
