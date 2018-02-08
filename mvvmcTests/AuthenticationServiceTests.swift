//
//  AuthenticationServiceTests.swift
//  mvvmcTests
//
//  Created by Andreas Kern on 08.02.18.
//

import XCTest
@testable import mvvmc


class AuthenticationServiceTests: XCTestCase {

    var service = BackendAuthenticationService()

    override func setUp() {
        super.setUp()
        service = BackendAuthenticationService()
    }
    
    func testLoginWithEmptyCredetials() {
        let expectation = XCTestExpectation()

        service.authenticate(username: "", password: "") { result in
            XCTAssertFalse(result)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testUserA() {
        let expectation = XCTestExpectation()

        service.authenticate(username: "userA", password: "passwordA") { result in
            XCTAssert(result)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testUserB() {
        let expectation = XCTestExpectation()

        service.authenticate(username: "userB", password: "passwordB") { result in
            XCTAssert(result)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testWrongCredetials() {
        let expectation = XCTestExpectation()

        service.authenticate(username: "anyUser", password: "anyPassword") { result in
            XCTAssertFalse(result)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}
