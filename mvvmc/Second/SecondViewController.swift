//
//  SecondViewController.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import UIKit

class SecondViewController: UIViewController {

    var viewModel: SecondViewModel!

    override func awakeFromNib() {
        title = "Second"
    }

    @IBAction func tapped() {
        viewModel.doit()
    }

    @IBAction func tappedBack() {
        viewModel.back()
    }
 }
