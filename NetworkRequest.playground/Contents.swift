import UIKit
import PlaygroundSupport



class DataService<T: Decodable> {
    
    var resourceURL: URL
    
    init(urlString: String) {
        guard let url = URL(string: urlString) else { fatalError() }
        resourceURL = url
    }
    
    func fetchData(completion: @escaping (Result<[T], DataError>) -> Void) {
        URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            if let jsonData = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([T].self, from: jsonData)
                    completion(.success(result))
                } catch {
                    completion(.failure(.unableToDecodeJson))
                }
            } else {
                completion(.failure(.noDataAvailable))
                return
            }
        }
        .resume()
    }
    
    enum DataError: Error {
        case noDataAvailable
        case unableToDecodeJson
    }
    
}



// Change to Codeable in SwiftUI
struct Task: Decodable {
    let id: Int
    let title: String
    let completed: Bool
}
/**
 {
     "userId": 1,
     "id": 1,
     "title": "delectus aut autem",
     "completed": false
   },
 */



class DemoViewController: UIViewController {
    
    let dataService = DataService<Task>(urlString: Constants.BASE_URL)
    
    var allTasks = [Task]()
    
    override func viewDidLoad() {
        dataService.fetchData { result in
            switch result {
            case .success(let tasks):
                tasks.forEach { task in
                    print(task)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    struct Constants {
        static let BASE_URL = "https://jsonplaceholder.typicode.com/todos"
    }
    
}



let demo = DemoViewController()
PlaygroundPage.current.liveView = demo
PlaygroundPage.current.needsIndefiniteExecution = true
