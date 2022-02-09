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
    
    @Published var books = [Book]()
    
    let url = URL(string: "https://the-one-api.dev/v2/book")!
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        loadBooks()
    }
    
    func fetchBooks() -> AnyPublisher<[Book], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map( { $0.data } )
            .decode(type: [Book].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func loadBooks() {
        fetchBooks()
            .sink { _ in
            } receiveValue: { [weak self] returnedBooks in
                print(returnedBooks.first! as Book)
                self?.books = returnedBooks
            }
            .store(in: &cancellables)
    }

}
