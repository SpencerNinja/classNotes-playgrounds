//
//  MockDataService.swift
//  DependencyInjection
//
//  Created by Spencer Hurd on 2/28/22.
//

import Foundation
import Combine

class MockDataService: DataServiceProtocol {
    
    let dummyData: [Post]
    
    init(data: [Post]?) {
        self.dummyData = data ?? [
            Post(userId: 1, id: 1, title: "One", body: "One"),
            Post(userId: 2, id: 2, title: "Two", body: "Two"),
            Post(userId: 3, id: 3, title: "Three", body: "Three")
        ]
    }
    
    func fetchData() -> AnyPublisher<[Post], Error> {
        Just(dummyData)
            .tryMap { $0 }
            .eraseToAnyPublisher()
    }
    
}
