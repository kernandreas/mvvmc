//
//  Coordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 08.02.18.
//

import UIKit

class BaseCoordinator {
    private let uuid = UUID()
    var childCoordinators = [UUID: Coordinator]()

    func addChild(_ child: Coordinator) {
        childCoordinators[child.uuid] = child
    }

    func removeChild(_ child: Coordinator) {
        childCoordinators[child.uuid] = nil
    }
}

protocol Coordinating {
    func start()
}

typealias Coordinator = BaseCoordinator & Coordinating
