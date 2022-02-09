//: [Previous](@previous)

// Write a function that takes a height and width of a rectangle and returns and array of integers that are the square root of each square sub-section

// check to see if both sides are equal
    // if they are, append one side to the list
// append to the array the shortest side
// minus the shortest side from the longest side and create a new variable newShort
// compare the shortside and newShort
// whichever side is shorter gets added to the list

func getSquareRoot(sideA: Int, sideB: Int) -> [Int] {
    
    var arrayOfSquares: [Int] = []
    
    if sideA == sideB {
        arrayOfSquares.append(sideA)
        return arrayOfSquares
    }
    
    if sideA < sideB {
        arrayOfSquares.append(sideA)
        let firstShortSide: Int = sideB - sideA
        arrayOfSquares.append(firstShortSide)
        let secondShortSide = sideA - firstShortSide
        arrayOfSquares.append(secondShortSide)
        let thirdShortSide = firstShortSide - secondShortSide
        arrayOfSquares.append(thirdShortSide)
    }
    
    if sideA > sideB {
        arrayOfSquares.append(sideB)
        let firstShortSide: Int = sideA - sideB
        arrayOfSquares.append(firstShortSide)
        let secondShortSide = sideB - firstShortSide
        arrayOfSquares.append(secondShortSide)
        let thirdShortSide = firstShortSide - secondShortSide
        arrayOfSquares.append(thirdShortSide)
    }
    
    // TODO: Use a ternary operator for each side instead
    // TODO: Rename sideA to width and sideB to height
//    var longSide: Int
//    var shortSide: Int {
//        if sideA < sideB {
//            longSide = sideB
//            return sideA
//        }
//        longSide = sideA
//        return sideB
//    }
//
//    var iterations: Int {
//        var count = 0
//        var flag = false
//        while !flag {
//            arrayOfSquares.append(shortSide)
//            let newShortSide = longSide - shortSide
//        }
//    }
    
    return arrayOfSquares
    
}

let test1 = getSquareRoot(sideA: 3, sideB: 5)
print("Array = \(test1)")

let test2 = getSquareRoot(sideA: 5, sideB: 3)
print("Array = \(test2)")

let test3 = getSquareRoot(sideA: 1, sideB: 3)
print("Array = \(test3)")

let test4 = getSquareRoot(sideA: 7, sideB: 4)
print("Array = \(test4)")

//: [Next](@next)

