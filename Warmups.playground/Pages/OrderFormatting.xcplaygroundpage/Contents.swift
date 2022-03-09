/*
 PROBLEM:
 Some new cashiers started to work at your restaurant. They are good at taking orders, but they don't know how to capitalize words, or use a space bar!

 All the orders they create look something like this:
    "milkshakepizzachickenfriescokeburgerpizzasandwichmilkshakepizza"

 The kitchen staff are threatening to quit, because of how difficult it is to read the orders.

 Their preference is to get the orders as a nice clean string with spaces and capitals like so:
    "Burger Fries Chicken Pizza Pizza Pizza Sandwich Milkshake Milkshake Coke"

 The kitchen staff expect the items to be in the same order as they appear in the menu.

 The menu items are fairly simple, there is no overlap in the names of the items:
     1. Burger
     2. Fries
     3. Chicken
     4. Pizza
     5. Sandwich
     6. Onionrings
     7. Milkshake
     8. Coke
 */

/*
 PSEUDOCODE:
 
 1. Check first two characters and find the matching menu item
 2. Capitalize first letter of item and add to new string
 3. If old string is not empty, add a space to end of new string
 3. Remove that item.count from the beginning of the old string
 4. Repeat
 */


var testString = "milkshakepizzachickenfriescokeburgerpizzasandwichmilkshakepizza"

func formatOrder() {
    var newString = ""
    
    while testString.count > 0 {
        let firstTwoCharacters = testString.prefix(2)
        var menuItem = ""
        
        switch firstTwoCharacters {
        case "bu":
            menuItem = "burger"
        case "fr":
            menuItem = "fries"
        case "ch":
            menuItem = "chicken"
        case "pi":
            menuItem = "pizza"
        case "sa":
            menuItem = "sandwich"
        case "on":
            menuItem = "onionrings"
        case "mi":
            menuItem = "milkshake"
        case "co":
            menuItem = "coke"
        default:
            print("String doesn't match. firstTwoCharacters = \(firstTwoCharacters)")
        }

        testString.deletingPrefix(menuItem)
        menuItem.capitalizeFirstLetter()
        newString.append(menuItem)
        newString.append(" ")
    }
    
}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

//print(formatOrder())
print(testString.capitalizingFirstLetter())
print("Hello")
