// Original
//class Enemy {
//    // Properties
//    var health: Int
//    var attackStrength: Int
//
//    init(health: Int, attackStrength: Int) {
//        self.health = health
//        self.attackStrength = attackStrength
//    }
//
//    func takeDamage(amount: Int) {
//        health -= amount
//    }
//
//    func move() {
//        print("Walk forwards.")
//    }
//
//    func attack() {
//        print("Land a hit, does \(attackStrength) damage.")
//    }
//}

// Nov 11 2021
class Enemy {
    // Properties
    // Requires initializer in a class
    var health: Int
    var attackStrength: Int

    init(health: Int, attackStrength: Int) {
        self.health = health
        self.attackStrength = attackStrength
    }

    func takeDamage(amount: Int) {
        health = health - amount
    }

    // Behaviours
    func move() {
        print("Walk forwards.")
    }

    func attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}

//struct Enemy {
//    // Properties
//    // Requires initializer in a class
//    var health: Int
//    var attackStrength: Int
//
//    init(health: Int, attackStrength: Int) {
//        self.health = health
//        self.attackStrength = attackStrength
//    }
//
//    // when this function gets called, old struct gets destroyed
//    mutating func takeDamage(amount: Int) {
//        health = health - amount
//    }
//
//    // Behaviours
//    func move() {
//        print("Walk forwards.")
//    }
//
//    func attack() {
//        print("Land a hit, does \(attackStrength) damage.")
//    }
//}
