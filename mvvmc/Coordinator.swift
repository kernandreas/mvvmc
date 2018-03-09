//
//  Coordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 08.02.18.
//

import UIKit

// This implementation is inspired by https://github.com/nvh/Coordinating-presentation and https://github.com/wtsnz/Coordinator-Example

protocol Dependencies {}

protocol Coordinator: class {

    associatedtype ViewController: UIViewController
    associatedtype CoordinatorDependencies

    var dependencies: CoordinatorDependencies { get set }
    var coordinatedViewController: ViewController? { get set }
    var presentingViewController: UIViewController? { get set }

    init(presentingViewController: UIViewController?, inject: CoordinatorDependencies)

    func createViewController() -> ViewController?

    func transition<C>(to coordinator: C.Type, _ inject: C.CoordinatorDependencies, _ applyToInstance: ((C) -> Void)?) where C : Coordinator

    func show()
    func dismiss()
}

extension Coordinator {

    func transition<C>(to coordinator: C.Type, _ inject: C.CoordinatorDependencies, _ applyToInstance: ((C) -> Void)? = nil) where C : Coordinator  {
        let instance = C.init(presentingViewController: coordinatedViewController, inject: inject)
        instance.show()

        applyToInstance?(instance)
    }

    func show() {
        guard let viewController = createViewController() else { return }
        self.coordinatedViewController = viewController
        presentingViewController?.show(viewController, sender: self)
    }

    func dismiss() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
