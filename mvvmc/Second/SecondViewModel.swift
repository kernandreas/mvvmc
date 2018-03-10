//
//  SecondViewModel.swift
//  mvvmc
//
//  Created by Andreas Kern on 13.02.18.
//

import Foundation

class SecondViewModel {

    var showNext: (() -> Void)?
    var goBack: (() -> Void)?

    func doit() {
        showNext?()
    }

    func back() {
        goBack?()
    }
}
