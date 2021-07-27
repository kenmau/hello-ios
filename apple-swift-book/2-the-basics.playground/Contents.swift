var x = 0.0, y = 0.0, z = 0.0
var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double

let minValue = UInt8.min
let maxValue = UInt8.max

let intValue: Int = 1
let uintValue: UInt = 2
let someResult = intValue + Int(uintValue)

typealias AudioSample = UInt16
let sample: AudioSample = 1

let http404Error = (statusCode: 404, description: "Not Found")
let (statusCode, statusMessage) = http404Error
print("The statusCode is \(statusCode)")
print("Another way to get the statusCode is \(http404Error.0)")
print("Another way to get the statusCode is \(http404Error.statusCode)")
print("Another way to get the statusMessage is \(http404Error.1)")

var serverResponseCode: Int? = 404
serverResponseCode = nil

let possibleNumber = "123"

// optional binding
if let actualNumber = Int(possibleNumber) {
    print("number!")
} else {
    print("not a number!")
}

let possibleString: String? = "An optional string"
let forcedString: String = possibleString! // forced unwrapped
let assumedString: String! = "Implicitly unwrapped optional string"
let implicitString: String = assumedString // no need for !

if assumedString != nil {
    print(assumedString!)
}

if let assumedString = assumedString {
    print(assumedString)
}

func canThrowAnError() throws {
    // could hrow error
}

do {
    try canThrowAnError()
    // no error
} catch {
    // error
}

enum SandwichError: Error {
    case outOfCleanDishes
    case missingIngredients([String])
}

func makeASandwich() throws {
    // ...
}

func washDishes() {
    // ...
}

func buyGroceries(ingredients: [String]) {
    // ...
}

//do {
//    try makeASandwich()
//} catch SandwichError.outOfCleanDishes {
//    washDishes()
//} catch SandwichError.missingIngredients(let ingredients) {
//    buyGroceries(ingredients: ingredients)
//}

let age = 3
assert(age >= 0, "A person's age can't be less than 0.")
