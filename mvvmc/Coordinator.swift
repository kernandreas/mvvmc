//
//  Coordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 08.02.18.
//

import UIKit

class Coordinator {

    private let identifier = UUID()
    private var childCoordinators = [Coordinator]()

    private func addChild(_ child: Coordinator) {
        childCoordinators.append(child)
    }

    private func removeChild(_ child: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 != child }
    }

    func coordinate(to coordinator: Coordinator) {
        addChild(coordinator)
        start()
    }

    func start() {
        fatalError("Implement in subclass")
    }
}

extension Coordinator: Equatable {
    static func ==(rhs: Coordinator, lhs: Coordinator) -> Bool {
        return rhs.identifier == lhs.identifier
    }
}
