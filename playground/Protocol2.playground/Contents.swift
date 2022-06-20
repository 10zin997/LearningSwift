import Cocoa

//the @Person class CONFORMS to protocol @Drivable which is adopted by
//class @Chair so the Person class can use a method of Chair class.
protocol Drivable{
    func driveIt()
}

class Chair:Drivable{
    func driveIt(){
        print("cannot drive chair")
    }
}

class Car: Drivable{
    func driveIt(){
        print("can drive car")
    }
}
class Person{
    var name: String = ""
    func willDrive(thisVehicle item : Drivable){
        item.driveIt()
        
    }
}
let chair = Chair()
chair.driveIt()
let car = Car()
car.driveIt()

let bob = Person()
bob.name = "Bob"
bob.willDrive(thisVehicle: chair)

