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

    var viewController: ViewController { get }
    var root: UIViewController { get }
}


extension Coordinator {

    func show() {
        root.show(viewController, sender: self)
    }

    func dismiss() {
        root.dismiss(animated: true, completion: nil)
    }
}
