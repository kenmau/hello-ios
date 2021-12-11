protocol CanFly {
    // Cannot have any implementation
    func fly()
}

class Bird {
    
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("The bird makes a new bird in a shell")
        }
    }
}

// Inherits Bird, Adopts CanFly
class Eagle: Bird, CanFly {
    func soar() {
        print("The eagle glides in the air using air currents.")
    }
    
    func fly() {
        print("The eagle flaps its wings and lifts off into the sky")
    }
}


// Inherits Bird
class Penguin: Bird {
    func swim() {
        print("The peguin paddles through the water.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

// protocols can be adopted by structures!!
struct Airplane: CanFly {
    func fly() {
        print("The airplane uses its engine to lift off in the air")
    }
}

let myEagle = Eagle()
myEagle.fly()

let myPenguin = Penguin()

let myPlane = Airplane()
myPlane.fly()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myPlane)
