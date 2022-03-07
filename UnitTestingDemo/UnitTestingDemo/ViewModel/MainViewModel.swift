//
//  MainViewModel.swift
//  UnitTestingDemo
//
//  Created by Spencer Hurd on 3/7/22.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var isPremium: Bool?
    @Published var dataArray: [String] = []
    @Published var selectedItem: String?
    
    init(isPremium: Bool?) {
        self.isPremium = isPremium
    }
    
    func addItem(item: String) {
        guard item != "" else { return }
        dataArray.append(item)
    }
    
    func selectItem(item: String?)  {
//        guard selectedItem == nil else { throw DataError.selectedItemNotNil}
        for i in dataArray {
            if i == item {
                selectedItem = i
            }
        }
//        if selectedItem == nil { throw DataError.itemDoesntExist }
    }
    
    func saveItem(item: String) throws {
        // Make sure item is valid
        guard item != "" else { throw DataError.itemIsEmptyString }
        // Make sure we are saving the correct item
        if let x = dataArray.first(where: { $0 == item }) {
            print("Item \(x) saved!")
        } else {
            throw DataError.itemDoesntExist
        }
    }
    
    enum DataError: Error {
        case itemIsEmptyString
        case itemDoesntExist
        case selectedItemNotNil
    }
    
}
