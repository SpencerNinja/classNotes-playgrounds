import Foundation
import UIKit

// API call using a completion handler

// Find our endpoint
let BASE_URL = "https://jsonplaceholder.typicode.com/posts"

let calendar = Calendar.current

// DataService that would be a separate file with a singleton
class DataService {
    static let shared = DataService()
    
    // Write a function that fetches the data
    // Condensed Version:
    func fetchSinglePostWithAsyncAwait(_ id: Int) async throws -> Post {
        guard let url = URL(string: "\(BASE_URL)/\(id)") else { throw NetworkingError.badURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkingError.badResponse }
        let post = try JSONDecoder().decode(Post.self, from: data)
        return post
    }
    
    // Longer Version:
//    func fetchSinglePostWithCompletion(withId id: Int, completion: @escaping (Result<Post, Error>) -> ()) throws {
//        // Make sure we have a valid url
//        guard let url = URL(string: "\(BASE_URL)/\(id)") else { throw NetworkingError.badURL }
//        // Create a URLSession task (on the background thread) (a URLSession connects us to a server)
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            // Check that the data is valid
//            if let data = data {
//                // It's good! Let's decode it
//                let decoder = JSONDecoder()
//                let post = try? decoder.decode(Post.self, from: data)
//                completion(.success(post!))
//            }
//            if error != nil {
//                completion(.failure(NetworkingError.unknownError))
//            }
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completion(.failure(NetworkingError.badResponse))
//                return
//            }
//        }.resume()
//    }
    
}

// Condensed Version:
code(for: "fetchSinglePostWithAsyncAwait") {
    Task {
        do {
            let asyncAwaitStart = Date.now
            let _ = try await DataService.shared.fetchSinglePostWithAsyncAwait(1)
            print("Post 1 finished on \(Thread.current)")
            let _ = try await DataService.shared.fetchSinglePostWithAsyncAwait(2)
            print("Post 2 finished on \(Thread.current)")
            let _ = try await DataService.shared.fetchSinglePostWithAsyncAwait(3)
            print("Post 3 finished on \(Thread.current)")
            let asyncAwaitEnd = Date.now
            let asyncAwaitNanoSeconds = calendar.dateComponents([.nanosecond], from: asyncAwaitStart, to: asyncAwaitEnd).nanosecond!
            print("All posts took \(asyncAwaitNanoSeconds) nanoseconds to execute using async await")
        }
    }
}


// Longer Version:
//code(for: "FetchSinglePostWithCompletion") {
//    // Call our singleton instance
//    try? DataService.shared.fetchSinglePostWithCompletion(withId: 1) { result in
//        switch result {
//        case .success(let post):
//            print(post)
//        case .failure(let error):
//            print("An error occurred: \(error)")
//        }
//    }
//    try? DataService.shared.fetchSinglePostWithCompletion(withId: 2) { result in
//        switch result {
//        case .success(let posts):
//            dump(posts)
//        case .failure(let error):
//            print("An error occurred: \(error)")
//        }
//    }
//    try? DataService.shared.fetchSinglePostWithCompletion(withId: 3) { result in
//        switch result {
//        case .success(let posts):
//            dump(posts)
//        case .failure(let error):
//            print("An error occurred: \(error)")
//        }
//    }
//}

// Create a custom error type
enum NetworkingError: Error {
    case badURL
    case badResponse
    case unableToDecode
    case unknownError
}

// Build our model(s) to store the result
struct Post: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
