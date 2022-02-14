//
//  ApiViewModel.swift
//  APICall2
//
//  Created by Spencer Hurd on 2/14/22.
//

import Foundation
import SwiftUI

class ApiViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init() {
        loadData { [weak self] posts in
            self?.posts = posts
        }
    }
    
    func loadData(completion: @escaping ([Post]) -> () ) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        URLSession.shared.dataTask(with: url!) { data, _, _ in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            print(posts)
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }
    
}
