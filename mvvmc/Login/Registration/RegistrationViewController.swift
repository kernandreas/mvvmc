//
//  RegistrationViewController.swift
//  mvvmc
//
//  Created by Andreas Kern on 15.03.18.
//

import UIKit

class RegistrationViewController: UIViewController {

    let viewModel: RegistrationViewModel

    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let userTextField = UITextField()
        userTextField.borderStyle = .roundedRect
        userTextField.placeholder = "Username"
        userTextField.translatesAutoresizingMaskIntoConstraints = false

        let passwordTextField = UITextField()
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        let registerButton = UIButton(type: .roundedRect)
        registerButton.setTitle("Register", for: .normal)
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        registerButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)

        let guide = UILayoutGuide()
        view.addLayoutGuide(guide)

        NSLayoutConstraint.activate([
            guide.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guide.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            guide.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            guide.bottomAnchor.constraint(equalTo: registerButton.bottomAnchor),
            guide.topAnchor.constraint(equalTo: userTextField.topAnchor),

            userTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            userTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor),

            passwordTextField.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 10),

            registerButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            ])

        NotificationCenter.default.addObserver(self, selector: #selector(userNameDidChange),name: .UITextFieldTextDidChange, object: userTextField)
        NotificationCenter.default.addObserver(self, selector: #selector(passwordDidChange), name: .UITextFieldTextDidChange, object: passwordTextField)

        viewModel.canRegister.observe {
            registerButton.isEnabled = $0
        }
    }

    @objc func userNameDidChange(notification: Notification) {
        guard let textField = notification.object as? UITextField else {
            return
        }
        viewModel.username = textField.text
    }

    @objc func passwordDidChange(notification: Notification) {
        guard let textField = notification.object as? UITextField else {
            return
        }
        viewModel.password = textField.text
    }

    @objc func didTapRegister() {
        viewModel.register()
    }
}
