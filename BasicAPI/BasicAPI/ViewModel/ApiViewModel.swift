//
//  ApiViewModel.swift
//  BasicAPI
//
//  Created by Spencer Hurd on 2/9/22.
//

import Foundation
import Combine
import SwiftUI

class ApiViewModel: ObservableObject {
    
    @Published var apiResponses = [ApiPosts]()
    
//    let url = URL(string: "https://the-one-api.dev/v2/book")!
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        loadBooks()
    }
    
    func fetchBooks() -> AnyPublisher<[ApiPosts], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map( { $0.data } )
            .decode(type: [ApiPosts].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func loadBooks() {
        fetchBooks()
            .sink { _ in
            } receiveValue: { [weak self] returnedPosts in
                print(returnedPosts.first! as ApiPosts)
                self?.apiResponses = returnedPosts
            }
            .store(in: &cancellables)
    }

}
