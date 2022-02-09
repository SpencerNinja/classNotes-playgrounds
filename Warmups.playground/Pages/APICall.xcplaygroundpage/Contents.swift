//: [Previous](@previous)

import Foundation
import Combine
import SwiftUI

/*
 Objectives:
    - Choose an API that you would like to do a URL request from
    - Build a model to map the JSON data to
    - Using MVVM create an API request and display the data however you like
    - For the URLSession you may use either a Publisher task or the old fashion way
 */

//: [Next](@next)

struct Book: Codable {
    var id: String
    var name: String
}

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
