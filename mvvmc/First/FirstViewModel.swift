//
//  FirstViewModel.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import Foundation

extension Bool: Dependencies {}

class FirstViewModel {

    let services: Services
    let coordinator: FirstCoordinator

    init(coordinator: FirstCoordinator) {
        self.coordinator = coordinator
        self.services = AppServices()
    }
}
