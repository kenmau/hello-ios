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
enum Rank: Int, CaseIterable {
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


enum Suit: CaseIterable {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func colour() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.colour()


enum ServerResponse {
    case result(String, String)
    case failure(String)
    case unknown(String)
}

let success = ServerResponse.result("6:00 am", "8:09pm")
let failure = ServerResponse.failure("Out of cheese.")
let unknown = ServerResponse.unknown("Unknown Error")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
case let .unknown(message):
    print("That wasa unexpected... \(message)")
}

// structs are always copied when they are passed around
// classes are passed by reference

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(rank.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

var deckOfCards = [Card]()
for suit in Suit.allCases {
    for rank in Rank.allCases {
        deckOfCards.append(Card(rank: rank, suit: suit))
    }
}

print(deckOfCards)
print(deckOfCards.count)

deckOfCards.forEach { card in
    print("\(card.rank) of \(card.suit)")
}

// protocol
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
    mutating func clear()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
    func clear() {
        simpleDescription = ""
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
    func clear() {
        // Cannot mutate because structs are immutable
        // simpleDescription = ""
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
    mutating func clear() {
        self = 0
    }
}

print (7.simpleDescription)

extension Double {
    var absoluteValue: Int {
        return Int(self)
    }
}

2.20.absoluteValue


let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)

//print(protocolValue.anotherProperty)


// Error Handling

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer Error \(printerError)")
} catch {
    print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

func makeArray<Whatever>(repeating item: Whatever, numberOfTimes: Int) -> [Whatever] {
    var result = [Whatever]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repeating: "knock", numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1,2,3], [2])
