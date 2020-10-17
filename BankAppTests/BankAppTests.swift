//
//  BankAppTests.swift
//  BankAppTests
//
//  Created by Arifin Firdaus on 17/10/20.
//

import XCTest
@testable import BankApp

struct Account {
    var balance = 0.0
}

class BankAppTests: XCTestCase {

    func test_Account_WhenInitialized_ShouldHaveBalanzeZero() {
        // when
        let sut = Account()
        
        // then
        XCTAssertEqual(sut.balance, 0.0)
    }

}
