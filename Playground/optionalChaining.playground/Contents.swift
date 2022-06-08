import Cocoa
//Optional Chaining
//forced unwrapping vs optional Chaining
class Person{
    var residence : Residence?
}

class Residence{
    var numOfRooms = 1
}

let john = Person()

//print(john.residence!.numOfRooms)  //triggers runtime error : Fatal error
print(john.residence?.numOfRooms)     // return nil, instead of crashing

// we cna weven give it a error handling
if let roomCount = john.residence?.numOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

//we can make it shorter using nil coalescing
print(john.residence?.numOfRooms ?? "unable to retrives the numer of rooms.")

//even thought numOfRoom has a value, it will always return nil when called for
    //becuase it has to be queried through and optional chain that return Int?
// we can access by giving john.resistance access of Residence class by assisgning
    //a Resistance instance to john.residence
john.residence = Residence()
if let roomCount = john.residence?.numOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

print("===========Defining Model Classes for Optional Chaining=============")
//lets call variours program thorguh optinal chaining.
class Person1 {
    var residence: Residence1?
}

class Residence1 {
    var rooms: [Room1] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room1 {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address1?
}
class Room1 {
    let name: String
    init(name: String) { self.name = name }
}
class Address1 {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}
print("===========Accessing Properties Through Optional Chaining=================")
let john1 = Person1()
if let roomCount = john1.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

//fails to print because the value is nil,since its a optional chainiing query
    //it will return nil adn the right side of = operator is never evaluated.
let someAddress = Address1()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john1.residence?.address = someAddress
print(john1.residence?.address)

//lets see it more clearly
//as we can see the function call doesnt go trhough
    //because nothing is prinited.
func createAddress1() -> Address1 {
    print("Function was called.")

    let someAddress = Address1()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"

    return someAddress
}
john1.residence?.address = createAddress1()
print(john1.residence?.address )

print("===========Calling Methods Through Optional Chaining=================")

if john1.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
//Calling Methods Through Optional Chaining
if (john1.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}

print("===========Accessing Subscripts Through Optional Chaining=================")
if let firstRoomName = john1.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

john1.residence?[0] = Room1(name: "Bathroom")

//non nil value
let johnsHouse = Residence1()
johnsHouse.rooms.append(Room1(name: "Living Room"))
johnsHouse.rooms.append(Room1(name: "Kitchen"))
john1.residence = johnsHouse

if let firstRoomName = john1.residence?[1].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "The first room name is Living Room."

print("===========Accessing Subscripts of Optional Type=================")
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
print(testScores)
