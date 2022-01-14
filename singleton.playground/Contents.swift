import UIKit

class Car {
    var colour = "Red"
}

let myCar = Car()
myCar.colour = "Blue"

let yourCar = Car()
print(yourCar.colour)


class CarSingleton {
    var colour = "Red"
    
    static let singletonCar = CarSingleton()
}

let anotherCar = CarSingleton.singletonCar
anotherCar.colour = "Blue"

let yetAnotherCar = CarSingleton.singletonCar
anotherCar.colour = "Brown"

