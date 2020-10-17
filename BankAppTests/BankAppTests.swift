//
//  BankAppTests.swift
//  BankAppTests
//
//  Created by Arifin Firdaus on 17/10/20.
//

import XCTest
@testable import BankApp

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
        let withdrawedAmount = try! sut.withdraw(amount: withdrawAmount)
        
        // then
        XCTAssertEqual(withdrawedAmount, withdrawAmount)
        XCTAssertEqual(sut.balance, (depositAmount - withdrawAmount))
    }
    
    func test_Account_WhenWithdrawWithBiggerAmountThanBalance_ShouldThrowInvalidWithdrawAmount() {
        // given
        var sut = Account()
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
    
    func test_Account_WhenInitializedAndImmediatelyWithdraw_ShouldThrowInvalidWithdrawAmount() {
        // given
        var sut = Account()
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
