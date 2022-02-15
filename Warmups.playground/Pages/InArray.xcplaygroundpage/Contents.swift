//: [Previous](@previous)

import Foundation

// Write a function that takes two arrays. The first is an array of substrings. Return a sorted array of string which contains any of those substrings. Sort them alphabetically.
// Add documentation using markup.

/*
 Example:
 
 let array1 = ["ell", "orl"]
 let array2 = ["family", "hello", "dog", "world"]
 
 inArray(array1, array2)
 
 Returns: ["hello", "world"]
 
*/

//: [Next](@next)


/*
 Psuedo Code
 - Inside the function
 1. create an empty array to store final array of sorted strings
 2. loop through the strings in the character array
 3. in a nested for loop, loop through the strings in the words array
 4. if word in words array contains characters in character array, add word to final list
 5. create a check to only add a word if it has not already been added
 6. outside of both loops, sort the final array
 7. return final array
 */

/// Summary
/// This function takes two arrays of strings and returns a third array of any strings in the second array that contain the strings in the first array.
/// - Parameters:
///   - charArray: [String]
///   - wordArray: [String]
/// - Returns: returns an array of any strings in the wordArray that contain the strings in the charArray.
func inArray(charArray: [String], wordArray: [String]) -> [String] {
    var finalArray: [String] = []
    for chars in charArray {
        for word in wordArray {
            if word.contains(chars) {
                if !finalArray.contains(word) {
                    finalArray.append(word)
                }
            }
        }
    }
    return finalArray.sorted()
}

let a1 = ["man", "woman", "spider", "fly", "cat", "bat", "snake", "turtle"] // 8 items
let a2 = ["joker", "spider-man", "catwoman", "batman", "green goblin", "spider-gwen"] // 6 items

print(inArray(charArray: a1, wordArray: a2))
