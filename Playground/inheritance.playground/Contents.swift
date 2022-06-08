import Foundation


//Base class = class where its not inherting from superclass or inhertis to subclass
//
class Vehicle {
    var currentSpeed = 0.0
    var description : String{
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise(){
        print ("honk honk")
    }
}
let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")
someVehicle.makeNoise()

//subclass

class Bicycle : Vehicle{
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.00
print("Bicycle basket : \(bicycle.hasBasket)")
print("Bicycle: \(bicycle.description)")

//even subclass can be subclassed

class Tandem : Bicycle{
    var currentPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = false
tandem.currentSpeed = 22.0
tandem.currentPassengers = 2
print("There are \(tandem.currentPassengers) passengers in this tandem")
print("Tandem: \(tandem.description)")
print("Tandem Basket : \(tandem.hasBasket)")

//Overriding: a subclass can have its own implementation of methods.
    //instance property , type property, or subscript.
//use override keyword

class Train : Vehicle{
    override func makeNoise() {
        print("Choo choo")
    }
}
let train = Train()
train.makeNoise()

//over riding getter and setter properties
//adding to the superclass

class Car: Vehicle{
    var gear = 1
    override var description: String{
        return super.description  + " in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

//overridng property observers
class AutomaticCar: Car{
    override var currentSpeed: Double {
        didSet{
            gear = Int(currentSpeed/10.0) + 1
        }
    }
}

let automaticCar = AutomaticCar()
automaticCar.currentSpeed = 35.0
print("AutomaticCar: \(automaticCar.description)")

