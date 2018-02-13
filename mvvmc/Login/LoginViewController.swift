//
//  LoginViewController.swift
//  mvvmc
//
//  Created by Andreas Kern on 08.02.18.
//

import UIKit

class LoginViewController: UIViewController {

    let viewModel: LoginViewModel

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }
}
