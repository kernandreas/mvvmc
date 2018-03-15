//
//  Observable.swift
//  Utils
//
//  Created by Andreas Kern on 01.03.18.
//  Copyright © 2018 DFL Digital Sports GmbH. All rights reserved.
//

public class Observable<T> {
    public var value: T {
        didSet { notify() }
    }

    private var observers = [(T) -> Void]()

    public init(_ value: T) {
        self.value = value
    }

    public func observe(_ observer: @escaping (T) -> Void) {
        observers.append(observer)
        observer(value)
    }

    private func notify() {
        observers.forEach { $0(value) }
    }
}
