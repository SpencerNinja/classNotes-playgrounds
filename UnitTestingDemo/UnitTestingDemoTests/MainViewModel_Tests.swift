//
//  MainTests.swift
//  UnitTestingDemoTests
//
//  Created by Spencer Hurd on 3/7/22.
//

import XCTest
@testable import UnitTestingDemo

/*
 Naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
 Naming structure: test_<struct/class>_<function/variable>_<expected result>
 */

class MainViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_MainViewModel_isPremium_shouldBeFalse() {
        // Given
        let userIsPremium: Bool? = false
        
        // When
        let vm = MainViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertFalse(vm.isPremium!)
    }
    
    func test_MainViewModel_isPremium_shouldBeInjectedValue_stress() {
        
        for _ in 0..<10 {
            // Given
            let userIsPremium: Bool = Bool.random()
            
            // When
            let vm = MainViewModel(isPremium: userIsPremium)
            
            // Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
    func test_MainViewModel_dataArray_shouldBeEmpty() {
        // Given
        
        // When
        let vm = MainViewModel(isPremium: Bool.random())
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_MainViewModel_dataArray_shouldAddItem() {
        // Given
        let vm = MainViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = Int.random(in: 1...100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, loopCount)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_MainViewModel_dataArray_shouldNotAddEmptyString() {
        // Given
        let vm = MainViewModel(isPremium: Bool.random())
        
        // When
        let emptyString = ""
        vm.addItem(item: emptyString)
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_MainViewModel_selectedItem_shouldBeSelectedItem() {
        // Given
        let vm = MainViewModel(isPremium: Bool.random())
        var itemsArray: [String] = []
        
        // When
        let loopCount: Int = Int.random(in: 1...100)
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        let randomItem = itemsArray.randomElement() ?? ""
        vm.selectItem(item: randomItem)
        
        // Then
        XCTAssertEqual(vm.selectedItem, randomItem)
        XCTAssertNotNil(vm.selectedItem)
    }
    
    func test_MainViewModel_saveItem_shouldThrowError_itemIsEmptyString() {
        // Given
        let vm = MainViewModel(isPremium: Bool.random())
        
        // When
        XCTAssertThrowsError(try vm.saveItem(item: ""))
        
        // Then
        XCTAssertThrowsError(try vm.saveItem(item: ""), "Should throw error empty item is an empty string") { error in
            let returnedError = error as? MainViewModel.DataError
            XCTAssertEqual(returnedError, MainViewModel.DataError.itemIsEmptyString)
        }
    }
    
    func test_MainViewModel_saveItem_shouldThrowError_itemDoesntExist() {
        // Given
        let vm = MainViewModel(isPremium: Bool.random())
        
        // When
        let itemToSave = UUID().uuidString
        
        // Then
        do {
            try vm.saveItem(item: itemToSave)
        } catch let error {
            let returnedError = error as? MainViewModel.DataError
            XCTAssertEqual(returnedError, MainViewModel.DataError.itemDoesntExist)
        }
    }

}
