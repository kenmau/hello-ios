
var skeleton1 = Enemy(health: 100, attackStrength: 10)
print(skeleton1.health)
skeleton1.move()
skeleton1.attack()

// copy by reference because it's a class
let skeleton2 = skeleton1

let skeleton3 = Enemy(health: 200, attackStrength: 30)
print(skeleton3.health)
skeleton3.move()
skeleton3.attack()

// Structs vs Classes?
// Classes:
// - can inherit from superclass
// - passed by reference
// - objetive c interoperability

/*
 Structs (Apple recommends try to use these first)
 - cannot inherrit
 - don't have to write init
 - immutable
 - passed by value
 - will create a copy when doing skeleton2 = skeleton1
 - changes will destroy old copy, and create new one
 */

/*
 Common:
 - creating blueprint
 
 */

let dragon = Dragon(health: 200, attackStrength: 20)
dragon.wingSpan = 5
dragon.attackStrength = 15 // property from superclass
dragon.move()
dragon.attack()
dragon.talk(speech: "My teeth are swords")

// if skeleton1 is a struct, any mutating function needs to occur on a var
skeleton1.takeDamage(amount: 10)
print(skeleton2.health)

// always start by creating struct
// structures are immutable; destroy old copy, create a new one
