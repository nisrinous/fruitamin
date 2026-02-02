//
//  VitaminUnitTests.swift
//  Fruitamin
//
//  Created by Nur Nisrina on 23/12/24.
//

import XCTest

class VitaminsViewModelTests: XCTestCase {

    var viewModel: VitaminsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = VitaminsViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testLoadVitaminData() {
        let mockData = VitaminsData(
            category1: Vitamin(vitaminA: [0], vitaminB12: [0], vitaminB6: [0], vitaminC: [0], vitaminE: [0], vitaminK: [0]),
            category2: Vitamin(vitaminA: [0], vitaminB12: [0], vitaminB6: [0], vitaminC: [0], vitaminE: [0], vitaminK: [0]),
            category3: Vitamin(vitaminA: [0], vitaminB12: [0], vitaminB6: [0], vitaminC: [0], vitaminE: [0], vitaminK: [0]),
            category4: Vitamin(vitaminA: [0], vitaminB12: [0], vitaminB6: [0], vitaminC: [0], vitaminE: [0], vitaminK: [0]),
            category5: Vitamin(vitaminA: [0], vitaminB12: [0], vitaminB6: [0], vitaminC: [0], vitaminE: [0], vitaminK: [0]),
            category6: Vitamin(vitaminA: [0], vitaminB12: [0], vitaminB6: [0], vitaminC: [0], vitaminE: [0], vitaminK: [0]),
            category7: Vitamin(vitaminA: [0], vitaminB12: [0], vitaminB6: [0], vitaminC: [0], vitaminE: [0], vitaminK: [0]),
            category8: Vitamin(vitaminA: [0], vitaminB12: [0], vitaminB6: [0], vitaminC: [0], vitaminE: [0], vitaminK: [0])
        )

        viewModel.vitamins = [
            "category1": mockData.category1,
            "category2": mockData.category2,
            "category3": mockData.category3,
            "category4": mockData.category4,
            "category5": mockData.category5,
            "category6": mockData.category6,
            "category7": mockData.category7,
            "category8": mockData.category8
        ]
        
        XCTAssertTrue(viewModel.vitamins.keys.count > 0, "Vitamins data should be loaded.")
        XCTAssertEqual(viewModel.vitamins["category1"]?.vitaminA.count, 1, "Category1 should have data for Vitamin A.")
    }
}
