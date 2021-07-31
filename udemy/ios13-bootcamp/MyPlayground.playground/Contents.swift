import Foundation

let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

var password: String = ""

for _ in 1...6{ password.append(alphabet.randomElement()!)}

print (password)

func greeting(name: String) {
    print("Hello \(name)!")
}

for _ in 0...3 {
    greeting(name: "Ken")
}

var myAge: Int = 3

func greeting2(whoToGreet: String) {
    print("hello \(whoToGreet)")
}

greeting2(whoToGreet: "Angela")

var player1Username: String? = nil
player1Username = "jackbauerisawesome"
var unwrappedP1Username = player1Username!
player1Username = nil

if player1Username != nil {
    print(player1Username!)
}

// Structs = Blueprint
struct Town {
    // Variables (Properties)
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    init(name: String, citizens: [String], resources: [String: Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    
    // Behaviours of structure
    // Functions (Method)
    func fortify() {
        print("Defences increased!")
    }
}

var anotherTown = Town(name: "Ken Land", citizens: ["Tom Hanks"], resources: ["Coconuts": 100])

var ghostTown = Town(name: "Ghosty", citizens: [], resources: ["Tumbleweed": 1])

anotherTown.citizens.append("Wilson")
ghostTown.fortify()



//// Created a new copy of the town structure
//// Initialization
//var myTown = Town()
//
//print(myTown.citizens)
//print("\(myTown.name) has \(myTown.resources["Grain"]) bags of grain.")
//
//myTown.citizens.append("Keanu Reeves")
//print(myTown.citizens.count)
//
//myTown.fortify()
