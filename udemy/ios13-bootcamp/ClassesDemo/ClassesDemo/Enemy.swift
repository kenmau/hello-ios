//
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

class Enemy {
    // Properties
    var health = 100
    var attackStrength = 10
    
    // Behaviours
    func move() {
        print("Walk forwards.")
    }
    
    func attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}
