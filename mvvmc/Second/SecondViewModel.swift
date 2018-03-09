//
//  SecondViewModel.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import Foundation

class SecondViewModel {

    let coordinator: SecondCoordinator!

    init(coordinator: SecondCoordinator) {
        self.coordinator = coordinator
    }

    func doit() {
        coordinator.transition(to: SecondCoordinator.self, AppServices())
    }

    func back() {
        coordinator.dismiss()
    }
}
