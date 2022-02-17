/*
 Create a program that tells an Amazon Delivery Driver how to pack a variable number of trucks evenly with a product. The products will be represented by an array of weights.
 
 Example:
    - Given the following array of packages with the following weights [2, 3, 1, 5, 3, 1, 4], divide the weight as evenly possible between 3 trucks.
    - Calculations
        - average weight per truck 6.33
        - sorted list = [5, 4, 3, 3, 2, 1, 1])
    - The result would look something like this:
        - Truck 1 = [5, 1]
        - Truck 2 = [4, 2]
        - Truck 3 = [3, 3, 1]
 */

// We have a pile of packages with different weights
// We have a number of trucks waiting to load said packages
// Find out the total weight of the packages
// Determine how to evenly distribute the weight between trucks
// Sort packages by heaviest first
// Start adding packages to the 1st truck until it is full
// Move onto next truck and repeat
// Return a list of weights for each truck

import Foundation

func calcMinimumNumPackages(numTrucks: Int, weightsArray: [Package]) -> [[Int]] {
    let sum = weightsArray.map { $0.weight }.reduce(0, +)
    let avg = sum / numTrucks
    var allWeights = weightsArray
    for _ in 1...numTrucks {
        trucks.append(Truck(maxWeight: avg))
    }
    for truck in trucks {
        truck.fill(amount: avg, packages: allWeights)
    }
    
    return [[]]
}

struct Truck {
    let maxWeight: Int
    var payload: Int
    
    mutating func fill(amount: Int, packages: [Package]) {
        // Loop through packages and fill the truck with any that will fit
        for package in packages {
            // check if the package will fit in the truck
            if package.weight < self.maxWeight {
                payload += package.weigth
                AmazonManager.packages.removeAll(where: package.id == )
            }
        }
    }
}

struct Package: Identifiable {
    let id = UUID().uuidString
    let weight: Int
}

class AmazonManager {
    
}
static var packages = [
    Package(weight: 1),
    Package(weight: 2),
    Package(weight: 3),
    Package(weight: 3),
    Package(weight: 4),
    Package(weight: 4),
    Package(weight: 4),
    Package(weight: 5),
    Package(weight: 6),
    Package(weight: 7),
    Package(weight: 7),
    Package(weight: 9)
]
print(calcMinimumNumPackages(numTrucks: 3, weights: weights.sorted(by: { $0 > $1 })))
