//
//  MainViewModel.swift
//  DependencyInjection
//
//  Created by Spencer Hurd on 2/28/22.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    
    var cancellables = Set<AnyCancellable>()
    
    var dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        fetchData()
    }
    
    func fetchData() {
        dataService.fetchData()
            .sink { _ in
                
            } receiveValue: { [weak self] posts in
                self?.posts = posts
            }
            .store(in: &cancellables)
    }
    
}
