import Cocoa

// A simple structure @Person thats adopts and conforms to a @FullyNamed protocol
//the name and type should be the same or else there will be an error
    //error: type 'Person' does not conform to protocol 'FullyNamed'
    //

    
protocol FullyNamed{
    var fullName: String {get}
}
struct Person : FullyNamed{
    var fullName: String
}
let john = Person(fullName: "John")
print(john.fullName)

//property requiremments
//class @Starship adopting and conforming to @FullyNamed protocol
//computed read-only property @fullName can be used since the protocol
    //is defined to be only gettable
//starship takes string varible @name and a optional string varible @prefix
    //since prefix is optional, it will return nothing if its nil
    //
class Starship: FullyNamed{
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
        
    }
    
    var fullName: String{
        return (prefix != nil ? prefix! + " " : " ") + name
    }
}
var shipName = Starship(name:"Enterprise",prefix: "USS" )
print(shipName.fullName)

//method requirements
//type method are prefixed with @static keyword
//protocol methods cannot have bodies of statement

protocol RandomNumberGenerator{
    func random()->Double
}
class LinearCongruentialGenerator: RandomNumberGenerator{
  
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")

//mutating method requirements
//@mutating keyword is required in protolol.
    //and also enumeration and struct but not class
protocol Toggable{
    mutating func toggle()
}

enum OnOffSwitch: Toggable{
    case on
    case off
    mutating func toggle(){
        switch self{
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
print(lightSwitch)
