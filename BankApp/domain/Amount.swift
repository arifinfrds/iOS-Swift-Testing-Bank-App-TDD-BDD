//
//  Amount.swift
//  BankApp
//
//  Created by Arifin Firdaus on 17/10/20.
//

import Foundation

struct Account {
    var balance = 0.0
    
    enum Error: Swift.Error {
        case invalidWithdrawAmount
    }
    
    mutating func deposit(amount: Double) {
        self.balance += amount
    }
    
    mutating func withdraw(amount: Double) throws -> Double {
        if amount > balance {
            throw Account.Error.invalidWithdrawAmount
        }
        self.balance -= amount
        return amount
    }
}
