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
    
    mutating func deposit(amount: Double) {
        self.balance += amount
    }
}

class BankAppTests: XCTestCase {

    func test_Account_WhenInitialized_ShouldHaveBalanzeZero() {
        // when
        let sut = Account()
        
        // then
        XCTAssertEqual(sut.balance, 0.0)
    }
    
    func test_Accoint_WhenDepositWithCertainAmount_ShouldUpdateTheBalance() {
        // given
        var sut = Account()
        
        // when
        sut.deposit(amount: 100)
        
        // then
        XCTAssertEqual(sut.balance, 100)
    }

}
