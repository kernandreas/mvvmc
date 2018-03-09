//
//  Coordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 08.02.18.
//

import UIKit

class BaseCoordinator {

    private let identifier = UUID()
    private var childCoordinators = [UUID: Coordinator]()

    private func addChild(_ child: Coordinator) {
        childCoordinators[child.identifier] = child
    }

    private func removeChild(_ child: Coordinator) {
        childCoordinators[child.identifier] = nil
    }

    func coordinate(to coordinator: Coordinator) {
        addChild(coordinator)
        coordinator.start()
    }
}

protocol Coordinating {
    func start()
}

typealias Coordinator = BaseCoordinator & Coordinating
