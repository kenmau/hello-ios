
let skeleton1 = Enemy(health: 100, attackStrength: 10)
print(skeleton1.health)
skeleton1.move()
skeleton1.attack()

// copy by reference
let skeleton2 = skeleton1

// Structs vs Classes?
// Classes:
// - can inherit from superclass
// - passed by reference

/*
 Structs
 - cannot inherrit
 - don't have to write init
 - passed by value
 - will create a copy when doing skeleton2 = skeleton1
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

skeleton1.takeDamage(amount: 10)
print(skeleton2.health)

// always start by creating struct
// structures are immutable; destroy old copy, create a new one
