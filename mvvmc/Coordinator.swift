//
//  Coordinator.swift
//  mvvmc
//
//  Created by Andreas Kern on 08.02.18.
//

import UIKit

// This implementation is inspired by https://github.com/nvh/Coordinating-presentation and https://github.com/wtsnz/Coordinator-Example

protocol Coordinator: class {

    associatedtype ViewController: UIViewController

    weak var viewController: ViewController? { get set }
    weak var root: UIViewController? { get set }

    func createViewController() -> ViewController?
}

extension Coordinator {

    func show() {
        guard let viewController = createViewController() else { return }
        self.viewController = viewController
        root?.show(viewController, sender: self)
    }

    func dismiss() {
        root?.dismiss(animated: true, completion: nil)
    }
}
