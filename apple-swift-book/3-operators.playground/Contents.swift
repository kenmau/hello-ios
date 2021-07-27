(3, "zebra") == (3, "bird")
("zebra", 5) < ("apple", 3)
("apple", 5) < ("zebra", 3)
("Zebra", 5) < ("apple", 3)
("Zebra", 5) < ("Apple", 3)

var a: Int?
let b: Int = 2
let c = a ?? b

// closed range
for index in 1...5 {
    print("\(index) times 5 is \(index*5)")
}

// half range
let names = ["Anna", "Alex", "Brian", "Jack"]
for i in 0..<names.count {
    print ("Person \(i) is called \(names[i])")
}

// one-sided range; start at 2 and continue to the end
for name in names[2...] {
    print(name)
}

// start at the beginning, and go to 2 inclusively
for name in names[...2] {
    print(name)
}

let range = ...5
print(range)

let sollarSign = "\u{24}"
var emptyString = ""
// strings are value types


var tuple = ("hello", 0)
print (tuple.1)

// Arrays ordered
// Sets/Dictionaries unordered
