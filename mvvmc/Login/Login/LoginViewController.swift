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

        view.backgroundColor = .white

        let loginButton = UIButton(type: .roundedRect)
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        let registerButton = UIButton(type: .roundedRect)
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loginButton)
        view.addSubview(registerButton)

        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            registerButton.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10)
            ])
    }

    @objc func didTapLogin() {
        viewModel.authenticate()
    }

    @objc func didTapRegister() {
        viewModel.register()
    }
}
