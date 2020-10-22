//
//  BankAppBDDTests.swift
//  BankAppTests
//
//  Created by Arifin Firdaus on 22/10/20.
//

import XCTest
@testable import BankApp

class Given_Create_Bank_Account: XCTestCase {
    var sut: Account!

    override func setUp() {
        super.setUp()
        
        self.sut = Account()
    }
}


class When_Initialized: Given_Create_Bank_Account {
    
    func test_ShouldHaveBalanzeZero() {
        XCTAssertEqual(sut.balance, 0.0)
    }
}


class When_DepositWithCertainAmount: Given_Create_Bank_Account {
    
    func test_ShouldUpdateTheBalance() {
        // when
        sut.deposit(amount: 100)
        
        // then
        XCTAssertEqual(sut.balance, 100)
    }
}


class When_WithdrawWithSmallerAmountThanBalance: Given_Create_Bank_Account {
    
    func test_ShouldReturnTheAmountAndDecreaseTheBalanceByAmount() {
        let depositAmount = 120.0
        let withdrawAmount = 50.0
        
        // when
        sut.deposit(amount: 120)
        let withdrawedAmount = try! sut.withdraw(amount: withdrawAmount)
        
        // then
        XCTAssertEqual(withdrawedAmount, withdrawAmount)
        XCTAssertEqual(sut.balance, (depositAmount - withdrawAmount))
    }
}


class When_WithdrawWithBiggerAmountThanBalance: Given_Create_Bank_Account {
    
    func test_ShouldThrowInvalidWithdrawAmount() {
        let deposit = 120.0
        let withdraw = 140.0
        var capturedError: Account.Error?
        
        // when
        sut.deposit(amount: deposit)
        
        do {
            _ = try sut.withdraw(amount: withdraw)
        } catch(let error) {
            capturedError = error as? Account.Error
        }
        
        // then
        XCTAssertNotNil(capturedError)
        XCTAssertEqual(capturedError!, .invalidWithdrawAmount)
    }
    
}


class When_InitializedAndImmediatelyWithdraw: Given_Create_Bank_Account {
    
    func test_ShouldThrowInvalidWithdrawAmount() {
        let withdraw = 140.0
        var capturedError: Account.Error?
        
        // when
        
        do {
            _ = try sut.withdraw(amount: withdraw)
        } catch(let error) {
            capturedError = error as? Account.Error
        }
        
        // then
        XCTAssertNotNil(capturedError)
        XCTAssertEqual(capturedError!, .invalidWithdrawAmount)
    }
}
