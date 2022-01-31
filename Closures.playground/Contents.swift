import UIKit



// What is a closure?

/**
 Just like functions, closures enable us to define a group of code statements that can be called as one unit, which
 both accept input and produce output. The difference however, is that closures can be defined inline - right at the
 point where we want to use them.
 
 Closures can be stored as properties and local variables. They can also be passed as arguments to function (or other closures)
 */



// For example:

struct IntToStringConverter {
    // A closure property that takes an Int as input and produces a String as output:
    var body: (Int) -> String
    
    // A closure defined as an inline variable, which takes no input and produces an Int as output:
    let intProvider: () -> Int = { return 9 }
    
    // A closure function argument that takes no input and doesn't produce any output
    func performOperation(then completion: () -> Void) {}
    
}



let sentence = "Hello SwiftUI my name is Spencer"

extension String {
    func transformWords(using closure: (Substring) -> String) -> String {
        
        // Split the current string up into word substrings
        let words = self.split(separator: " ")
        
        // Create empty array of strings to store our result
        var result = [String]()
        
        // Iterate through each word and transform it
        for word in words {
            let transformed = closure(word)
            result.append(transformed)
        // We will call the closure that was passed into our function
        }
        
        // Join our results array back into a string
        return result.joined(separator: " ")
        
    }
}

//print(sentence.transformWords(using: { word in return word.lowercased() }))

print(sentence.transformWords(using:  {word in return word.lowercased() }))

// Trailing closure syntax
print(sentence.transformWords { word in word.lowercased()})

// Using default variables
print(sentence.transformWords { $0.lowercased() })

//let result = words.map(closure)



// It is also common to want to store a closure for later use.
// For example, let's say that we wanted to write a delay function that lets us delay the execution of any closure by x seconds.
// To do that, we'll use Grand Central Dispatch's asyncAfter API.
// However, since passing our closure to that API will cause it to be stored until our delay time interval has passed, we need to mark it with @escaping
func delay(by seconds: TimeInterval,
           on queue: DispatchQueue = .main,
           closure: @escaping () -> Void) {
    queue.asyncAfter(deadline: .now() + seconds, execute: closure)
}

delay(by: 3) { print("This was a delayed response...")}
