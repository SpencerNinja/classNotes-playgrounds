import UIKit
import Foundation

// OBJECTIVE:
// You are creating a game. The game has a reward system that includes money, trophies and stars. Stars and trophies are awarded one at a time, but money can be added in any amount. Each user is able to track how much cash and how many trophies and stars they have. Create the reward system, and user. Then make at least two users, give them some rewards, and finally print each user along with their rewards. Make the grammar be proper based on how many items the user has.

// REQUIREMENTS:
// Use at least all of the following concepts in your code:
// Enum (with and without associated values)
// Iteration
// Stored Properties
// Computed Properties
// Struct
// Array
// Switch
// Tuple
// Function
// Ternary operator

// EXAMPLE RUN:
//Tanner has $49, 1 trophy and 3 stars.
//Tina has $78, 3 trophies and 5 stars.
//Carter has $0, 0 trophies and 1 star.



// PSUEDOCODE:
// Create struct for a User
// Create an enum for reward types (money, trophies, and stars)
// Create a tuple belonging to User for storing reward amounts
// Methods for getting and updating values of rewards
// Initialize a few Users and give them some rewards
// Loop through users and print how many rewards each user has
// Computed property switching on reward types

struct User {
    
    enum RewardType {
        case money(Int)
        case trophy
        case star
    }
    
    var name: String = ""
    var rewards = (money: 0, trophy: 0, star: 0)
    
    var rewardAmounts: (Int, Int, Int) {
        rewards
    }
    
    mutating func giveReward(reward: RewardType) {
        switch reward {
        case .money(let amount):
            rewards.money += amount
        case .star:
            rewards.star += 1
        case .trophy:
            rewards.trophy += 1
        }
    }
    
}

var tanner = User(name: "Tanner")
var betsy = User(name: "Betsy")
var luigi = User(name: "Luigi")

tanner.giveReward(reward: .trophy)
tanner.giveReward(reward: .trophy)
tanner.giveReward(reward: .money(5))
betsy.giveReward(reward: .money(8))
betsy.giveReward(reward: .star)
betsy.giveReward(reward: .trophy)
luigi.giveReward(reward: .star)
luigi.giveReward(reward: .star)


var users = [tanner, betsy, luigi]



for user in users {
    print("""
    \(user.name) has $\(user.rewards.money), \(user.rewardAmounts.1) \(user.rewardAmounts.1 != 1 ? "trophies" : "trophy") and \(user.rewardAmounts.2) \(user.rewardAmounts.2 != 1 ? "stars" : "star").
    """)
}

