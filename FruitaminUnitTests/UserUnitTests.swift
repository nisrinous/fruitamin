//
//  UserUnitTests.swift
//  Fruitamin
//
//  Created by Nur Nisrina on 23/12/24.
//

import XCTest

class UserViewModelTests: XCTestCase {

    var viewModel: UserViewModel!
    var initialUser: User!

    override func setUpWithError() throws {
        initialUser = User(
            name: "User",
            dailyNeedVitaminA: 1000,
            dailyNeedVitaminB6: 10,
            dailyNeedVitaminB12: 2,
            dailyNeedVitaminC: 50,
            dailyNeedVitaminE: 15,
            dailyNeedVitaminK: 80,
            consumedVitaminA: 300,
            consumedVitaminB6: 6,
            consumedVitaminB12: 1,
            consumedVitaminC: 30,
            consumedVitaminE: 5,
            consumedVitaminK: 40
        )

        viewModel = UserViewModel(user: initialUser, userAge: 25, userGender: "Male")
    }

    override func tearDownWithError() throws {
        viewModel = nil
        initialUser = nil
    }

    func testInitialization() throws {
        XCTAssertEqual(viewModel.user.name, "User")
        XCTAssertEqual(viewModel.user.consumedVitaminA, 300)
        XCTAssertEqual(viewModel.user.consumedVitaminB6, 6)
        XCTAssertEqual(viewModel.user.consumedVitaminB12, 1)
        XCTAssertEqual(viewModel.user.consumedVitaminC, 30)
        XCTAssertEqual(viewModel.user.consumedVitaminE, 5)
        XCTAssertEqual(viewModel.user.consumedVitaminK, 40)
        XCTAssertEqual(viewModel.userAge, 25)
        XCTAssertEqual(viewModel.userGender, "Male")
    }

    func testUpdateVitaminConsumption() throws {
       
        XCTAssertEqual(viewModel.user.consumedVitaminA, 300)
        XCTAssertEqual(viewModel.user.consumedVitaminB6, 6)

        viewModel.updateVitaminConsumption(vitamin: "A", amount: 100)
        viewModel.updateVitaminConsumption(vitamin: "B6", amount: 2)

        XCTAssertEqual(viewModel.user.consumedVitaminA, 400)
        XCTAssertEqual(viewModel.user.consumedVitaminB6, 8)
    }

    func testDefineUserCategory() throws {
        let contentView = ContentView()
        
        XCTAssertEqual(contentView.defineUserCategory(), "category1")
    }
}
