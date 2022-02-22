/**
 INSTRUCTIONS:
 Write a function that takes a sentence as a String and returns that sentence with any word 5 characters or more, reversed.
 */

/*
 PSUEDOCODE:
 1. function takes in a string as a parameter
 2. loop through the string and append each word to a list
 3. loop through the list and re-add each word to the string
    4. if the word > 5, reverse the string, then re-add
 5. return formatted string
 */

func spinFiveOrMore(str: String) -> [String] {
    var tempList: [String] = []
    var tempWord: String = ""
    var count = 1
    // use split method instead
    for char in str {
        if char != " " {
            tempWord.append(char)
            count += 1
        } else if char == " " || count == str.count {
            tempList.append(tempWord)
            tempWord = ""
            count += 1
        }
    }
    // use joined method instead
    return tempList
}

var str1 = "Ninja Turtles like pizza and ninjitsu."
print(spinFiveOrMore(str: str1))
