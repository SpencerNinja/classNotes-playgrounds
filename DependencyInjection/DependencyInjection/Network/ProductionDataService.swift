//
//  ProductionDataService.swift
//  DependencyInjection
//
//  Created by Spencer Hurd on 2/28/22.
//

import Foundation
import Combine

class ProductionDataService: DataServiceProtocol {
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func fetchData() -> AnyPublisher<[Post], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
