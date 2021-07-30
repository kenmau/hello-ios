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

