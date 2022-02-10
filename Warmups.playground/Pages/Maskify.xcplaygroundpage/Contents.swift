import UIKit

/*
 Write a function that takes a string as input and return a string with all the characters except for the last four as "#"s
 
 For example:
    "123456789"
    returns "#####6789"
 
 
 */

// --------------------------------------------------------------------------------------------
// MY SOLUTION
func maskify(_ string: String) -> String {
    
    var maskedString: String = ""
    let stoppingPoint = string.count - 3
    var indexPosition = 1
    
    for char in string {
        (indexPosition < stoppingPoint) ? maskedString.append("#") : maskedString.append(char)
        indexPosition += 1
    }
    
    return maskedString
}

//let numbers = "123456789"
let numbers = "1238494959505595"
//let numbers = "0495838855748392998484858559483838485"
//let numbers = "104"
//let numbers = "2395"
//let numbers = ""
print(maskify(numbers))

// --------------------------------------------------------------------------------------------
// MOST CONDENSED SOLUTION

func swiftfulMaskify(_ string: String) -> String {
    string.enumerated().map { $0 < string.count - 4 ? "#" : "\($1)"}.joined()
}

//let testStr = "Hello World"
//print(testStr.enumerated().map { $0 })

// --------------------------------------------------------------------------------------------
// OTHER SOLUTIONS
