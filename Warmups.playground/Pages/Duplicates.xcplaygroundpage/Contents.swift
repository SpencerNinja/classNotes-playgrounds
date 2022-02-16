import Foundation

/*
 INSTRUCTIONS
 Write a function that will return the count of distinct case-insensitive alphabetic characters and numberic digits that occur more than once in the input string. The input string can be assumed to contain only alphabetic and numberic characters (both upper and lowercase for alphabetic characters).
 
 for example:
    input: "abcde"
    output: 0
 
    input: "aabBcde"
    output: 2
 */


/**
 MY PSUEDOCODE:
    1. create a count variable
    2. loop through string of characters
        3. compare each character with the other characters in the string
        4. if it is a match, add 1 to count
    5. return count
 
    // MY 1ST ATTEMPT
     func countDuplicates(_ str: String) -> Int {
         var count = 0
         for char1 in str {
             for char2 in str {
                 if char1 == char2 {
                     count += 1
                 }
             }
         }
        return count
    }
    ____________________
 
    1. create a count variable to store count
    2. select a variable in the string
    3. compare that variable with every character in the string
    4. if the variable is the same as the character, increment the count
    5. change the value of the variable to the next character and repeat
    6. return count
 
    // MY 2ND ATTEMPT
    func countDuplicates(_ str: String) -> Int {
        var count = 0
        var selectedChar = ""
         for i in 0..<str.count {
             selectedChar = str[i]
             for char in str {
                 if selectedChar == char {
                     count += 1
                 }
             }
         }
        return count
    }
    ____________________
 
    1. create a variable to store the count
    2. create a variable to store string parameter and convert to lowercase
    3. loop through string indices using selectedCharacterIndex
    3. in a nested for loop, create a comparedCharIndex to compare each character in the string with the selectedCharacterIndex
    4. compare char at selectedCharacterIndex with char at comparedCharacterIndex, if a match, increment count
    5. return count
 
    // MY 3RD ATTEMPT (works for str1 test, but not for the other test cases)
    func countDuplicates(_ str: String) -> Int {
        var count = 0
        let newString = str.lowercased()
        for selectedCharIndex in newString.indices {
             for comparedCharIndex in newString.indices.suffix(from: newString.index(after: selectedCharIndex)) {
                 if (newString[selectedCharIndex] == newString[comparedCharIndex]) {
                     count += 1
                 }
             }
         }
         return count
     }
 */

// MY 4TH ATTEMPT
func countDuplicates(_ str: String) -> Int {
    var count = 0
    let newString = str.lowercased()
    for char in newString {
        let tempString = newString
        tempString.remove(char)
        if tempString.contains(char) {
            count += 1
        }
    }
    return count
}
var str1 = "aabBcde"            // 2 duplicates
var str2 = "AaA"                // 1 duplicate
var str3 = "zZyyXWwVvVuTT"      // 5 duplicates
var str4 = "Hello World"        // 2 duplicates
code(for: "countDuplicates") {
    print(countDuplicates(str4))
}



// Phil's solution
func betterCountDuplicates(_ str: String) -> Int {
    let sortedStr = str.map { $0.lowercased() }.sorted()
    let mappedItems = sortedStr.map { ($0, 1) }
    let counts = Dictionary(mappedItems, uniquingKeysWith: +)
    return counts.filter { dict in
        dict.value > 1
    }.count
}
code(for: "betterCountDuplicates") {
    print(betterCountDuplicates("2353aaadkjlkjdddfee"))
}


          
// CodeWar's solution
func swiftyCountDuplicates(_ S: String) -> Int {
    var counts: [String: Int] = [:]
    for character in Array(S) {
        counts[character.lowercased(), default: 0] += 1
    }
    return counts.values.filter { $0 > 1 }.count
}
code(for: "swiftyCountDuplicates") {
    print(swiftyCountDuplicates("aabBcde"))
}
