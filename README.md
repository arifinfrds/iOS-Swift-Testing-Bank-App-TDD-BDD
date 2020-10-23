# iOS-Unit Testing BankApp (Section 4 & 7)

My Testing implementation for course about TDD and BDD (section 4 & 7): https://www.udemy.com/course/testing-ios-apps-behavior-driven-development-using-swift/

Example: 
```swift
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

```

My Version: 
```swift
class BankAppTests: XCTestCase {
    
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

```
