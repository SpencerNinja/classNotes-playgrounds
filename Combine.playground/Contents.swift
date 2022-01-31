import Foundation
import Combine

// Examples of Combine
//      @Published

/**
 Announced in 2019
 Apple's Combine framework lets us model all sorts of aynchronous events and operations as "values over time"
 
 Core principles:
 
 Publisher - an Observable Object that emits values whenever a given event occurs. Publishers can either be active indefinitely or eventually completed. They can also optionally fail when an error was encountered.
 
 Apple went through some of their core libraries in order to retrofit them with Combine support. For example, here's how we could use Foundation's URLSession to create a publisher for making a network request to a given URL.
 */

let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
let publisher = URLSession.shared.dataTaskPublisher(for: url)

/*
 Once we've created a publisher, we can then attach subscriptions to it.
 For example, by using the sink API = which lets us pass a closure to be called once the publisher is completed:
 */
let cancellable1 = publisher.sink { completion in
    // This gets called when publishing is completed
    print(completion)
} receiveValue: { value in
    // This can be called multiple times, each time a new value is emitted by the publisher
    print(value)
}

/*
 Pay attention to where sink returns a value that we store as cancellable. When attaching a new subscriber, a Combine publisher always returns an object that conforms to the Cancellable protocol, which acts as a token for the new subscription.
 
 We then need to retain that token for as long as we want the subscription to remain active, since once it gets deallocated, our subscriptoion will automatically be cancelled. So if we want, we can cancel the subscription by calling cancel() on the token.
 */

let cancellable2 = publisher.sink { completion in
    switch completion {
    case .failure(let e):
        print("Error: \(e)")
    case .finished:
        print("Success")
    }
} receiveValue: { value in
    let decoder = JSONDecoder()
    do {
        // Since each value passed into our closure will be a tuple containing the downloaded data as well as the network response, we are accessing the 'data' property:
        let users = try decoder.decode([User].self, from: value.data)
        print(users)
    } catch let e {
        print("Error: \(e)")
    }
}

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let address: Address
    struct Address: Codable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: GeoLocation
        struct GeoLocation: Codable {
            let lat: String
            let lng: String
        }
    }
    let phone: String
    let website: String
    let company: Company
    struct Company: Codable {
        let name: String
        let catchPhrase: String
        let bs: String
    }
}

/*
 {
     "id": 1,
     "name": "Leanne Graham",
     "username": "Bret",
     "email": "Sincere@april.biz",
     "address": {
       "street": "Kulas Light",
       "suite": "Apt. 556",
       "city": "Gwenborough",
       "zipcode": "92998-3874",
       "geo": {
         "lat": "-37.3159",
         "lng": "81.1496"
       }
     },
     "phone": "1-770-736-8031 x56442",
     "website": "hildegard.org",
     "company": {
       "name": "Romaguera-Crona",
       "catchPhrase": "Multi-layered client-server neural-net",
       "bs": "harness real-time e-markets"
     }
   }
 */

/*
 There's nothing wrong with doing a URLSession the traditional way but the true power of Combine and (reactive programming in general) lies in constructing chians of operations that our data get streamed through. These are called pipelines.
 
 // Map operator
 This lets us transform each value that a publisher emits into a new form.
 
 // Other operators
 filter
 debounce
 drop
 collect
 
 */

// We have an array of users
// We want to map them to just the names of the users
// let arrayOfUsers [User, User, User]
// arrayOfUsers.map { $0.name }.filter

let dataPublisher = publisher.map(\.data) // Accessing the 'data' property via keypath

let userPublisher = publisher
    .map(\.data)
    .decode(
        type: [User].self,
        decoder: JSONDecoder()
    )

// As a general rule, try to keep all subscription closers as simple as possible

let threadSafeUserPublisher = publisher
    .map(\.data)
    .decode(
        type: [User].self,
        decoder: JSONDecoder()
    )
    .receive(on: DispatchQueue.main)

class Counter {
    private(set) var value = 0
    
    func increment() {
        value += 1
    }
}

let counter = Counter()
counter.increment()
print(counter.value)

class CounterWithCombine {
    let publisher = PassthroughSubject<Int, Never>() // We use 'Never' so it'll never throw any errors
    
    let cancellables = Set<AnyCancellable>()
    
    private(set) var value = 0 {
        // whenever our property is set, we will send it's value to our publisher
        didSet {
            publisher.send(value)
        }
    }
    
    func increment() {
        value += 1
    }
}

let counter2 = CounterWithCombine()
let cancellable3 = counter2.publisher
    .filter { $0 > 1 }
    .sink {value in
        print(value)
    }
//    .store(in: &counter2.cancellables)

counter2.increment()
counter2.increment()
counter2.increment()
counter2.increment()
counter2.increment()
print(counter2.value)

class testViewModel: ObservableObject {
    @Published var someData = "some text"
    @Published var someNum = 50
    
    func subscribeToPublishers() {
        $someData.combineLatest($someNum)
    }
}

/*
 RECAP
 
 - A publisher is an observable object that emits values over time. Can optionally be completed when there are no more values or when an error happens.
 
 - Subscribers are objects or closures that are used to observe a publisher.
 
 - Operators are used to build reactive chains (pipelines) that our data can flow through. Each operator modifies our data in some way and passes it along the pipeline.
 
 - A cancellable is used to keep track of a subscription to a publisher and needs to be retained for as long as we want that subscription to remain active.
 */
