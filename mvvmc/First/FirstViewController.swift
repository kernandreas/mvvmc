//
//  FirstViewController.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class FirstViewController: UIViewController {

    let viewModel: FirstViewModel

    init(viewModel: FirstViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "First"
    }
}
