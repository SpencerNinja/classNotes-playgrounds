/* OBJECTIVE:
 Create a program that sorts an array of packages into different trucks based on their id.
 
 Example:
    - Given the following array of packages with the following id's [2, 3, 1, 2, 3, 1, 2], divide the packages into groups based on their id.
    - The result would look something like this:
        - Truck 1 = [1, 1]
        - Truck 2 = [2, 2, 2]
        - Truck 3 = [3, 3]
 */


/* PSUEDOCODE:
 1. create a function that takes in the array of ids (idArray)
    2. create an empty array to store the final arrays (finalArray)
    3. sort the idArray
    4. create an empty array (duplicateArray) to temporarily store duplicate id's
    5. loop through the idArray (for num in idArray) / while idArray is not empty
        6. if duplicateArray is empty or num == duplicateArray[0]
            7. append first number in idArray to duplicateArray
            8. remove first number from idArray
        9. if duplicateArray is not empty and num != duplicateArray[0]
            10. append duplicateArray to finalArray
            11. duplicateArray = []
    11. return finalArray
 12. call function
 */

import Foundation

func calcMinimumNumPackages(idArray: [Int]) -> [[Int]] {
    
    return [[]]
}

