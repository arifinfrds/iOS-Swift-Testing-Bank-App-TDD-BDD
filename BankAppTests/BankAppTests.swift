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
    
    mutating func withdraw(amount: Double) -> Double {
        self.balance -= amount
        return amount
    }
}

class BankAppTests: XCTestCase {

    func test_Account_WhenInitialized_ShouldHaveBalanzeZero() {
        // when
        let sut = Account()
        
        // then
        XCTAssertEqual(sut.balance, 0.0)
    }
    
    func test_Account_WhenDepositWithCertainAmount_ShouldUpdateTheBalance() {
        // given
        var sut = Account()
        
        // when
        sut.deposit(amount: 100)
        
        // then
        XCTAssertEqual(sut.balance, 100)
    }
    
    func test_Account_WhenWithdrawWithSmallerAmountThanBalance_ShouldReturnTheAmountAndDecreaseTheBalanceByAmount() {
        // given
        var sut = Account()
        let depositAmount = 120.0
        let withdrawAmount = 50.0
        
        // when
        sut.deposit(amount: 120)
        let withdrawedAmount = sut.withdraw(amount: withdrawAmount)
        
        // then
        XCTAssertEqual(withdrawedAmount, withdrawAmount)
        XCTAssertEqual(sut.balance, (depositAmount - withdrawAmount))
    }

}
