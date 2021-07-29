// Arrays ordered
// Sets/Dictionaries unordered

// Create Empty Array
var someInts = [Int]()
someInts.append(3)
someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.0, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingList: [String] = ["Eggs", "Milk"]

shoppingList.isEmpty ? print("Empty") : print ("Not Empty")

shoppingList.append("Bread")
shoppingList += ["Flour"]

for (index, value) in shoppingList.enumerated() {
    print("Item \(index): \(value)")
}

// Sets = order isn't important, ensure item only appears once
// Type must be hashablew before storing in a set

var letters = Set<Character>()
print("letters is of the type Set<Character> with \(letters.count) items.")
letters.insert("a")
letters = [] // empty set

//var favouriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favouriteGenres: Set = ["Rock", "Classical", "Hip hop"]

for genre in favouriteGenres.sorted() {
    print("\(genre)")
}
    
// Set Operations
// union, intersection, subtracting, symmetricDifference

// Dictionaries

