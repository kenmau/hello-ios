let explicitFloat: Float = 4
print(explicitFloat)

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"

let name = "Sam"
let nameSummary = "Calculation \(5.0+4.0) " + name

let tripleQuotation = """
    I said "Test"
    Hello World
    """
print(tripleQuotation)

var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "coke"
print(shoppingList)
shoppingList.append("milk")

var occupations = [
    "Ken": "Tech Lead",
    "Anisa": "Business Analyst"
]

occupations["Madeeha"] = "Scrum Master"
// Cannot do this
//occupations["Double"] = 1.0
print(occupations)

let emptyArray = [String]()
let emptyDictionary = [String: Float]()
shoppingList = []
occupations = [:]

let indivitualScores = [1, 2, 3, 4, 5]
var teamScore = 0
for score in indivitualScores {
    if score > 3 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Bye!"
}

print(greeting)

func testGuardLet() {
    guard let name = optionalName else {
        return
    }
    print(name)
}
testGuardLet()

let nickName: String? = nil
let fullName: String = "Ken Mau"
let informalGreeting = "Hi \(nickName ?? fullName)"

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("it's celery!")
case "cucumber", "watercress":
    print("hmmm")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("default \(vegetable)")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fib": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
var largestSeq = ""
for (seq, numbers) in interestingNumbers {
    for number in numbers {
        print(seq + " " + "\(number)")
        if number > largest {
            largest = number
            largestSeq = seq
            
        }
    }
}
print(largest)
print(largestSeq)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while n < 100
print(m)

var total = 0
for i in 0..<4 { // excludes 4
    total += i
    print(i)
}
print(total)

for i in 0...4 { // includes 4
    total += i
    print(i)
}
print(total)


func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("Bob", on: "Tuesday")

// tuples and compound value
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let stats = calculateStatistics(scores: [5, 4, 7, 2])
print(stats.sum)
print(stats.2)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    
    return y
}
returnFifteen()

// Function can return function
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// Function can take another function as one of it's arguments

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool{
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]

print(hasAnyMatches(list: numbers, condition: lessThanTen))


// Closures
let numResult = numbers.map({ (number: Int) -> Int in
    if (number % 2) == 1 {
        return 0
    }
    
    return number
})
print(numResult)

let mappedNumbers = numbers.map({ number in
    3 * number
})


let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)

class Shape {
    var numberOfSides = 0
    let somethingElse = ""
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func takesAnArgument(something: String) {
        
    }
}


var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let square = Square(sideLength: 5.2, name: "Test Square")
square.area()
square.simpleDescription()

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 1
    }
    
    func area() -> Double {
        return 3.14 * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)."
    }
}

let circle = Circle(radius: 3.0, name: "Test Circle")
circle.area()
circle.simpleDescription()

// Properties getter and setter

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "An Equilaternal Triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "Another Test Shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "Larger Square")
print(triangleAndSquare.triangle.sideLength)

// Optional Values
let optionalSquare: Square? = Square(sideLength: 2.5, name: "Optional Square")
let sideLength = optionalSquare?.sideLength

// Enum
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
    func compareTo(rank: Rank) -> String {
        if self.rawValue > rank.rawValue {
            return "\(self.simpleDescription()) is bigger than \(rank.simpleDescription())"
        } else if self.rawValue < rank.rawValue {
            return "\(self.simpleDescription()) is smaller than \(rank.simpleDescription())"
        } else {
            return "\(self.simpleDescription()) is the same as \(rank.simpleDescription())"
        }
    }
}

let ace = Rank.ace
let two = Rank.two
let jack = Rank.jack
let aceRawValue = ace.rawValue

print(two.compareTo(rank: ace))
print(ace.compareTo(rank: two))
print(jack.compareTo(rank: ace))

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}
