import Cocoa
import Foundation

//// A simple structure @Person thats adopts and conforms to a @FullyNamed protocol
////the name and type should be the same or else there will be an error
//    //error: type 'Person' does not conform to protocol 'FullyNamed'
//    //
//
//
//protocol FullyNamed{
//    var fullName: String {get}
//}
//struct Person : FullyNamed{
//    var fullName: String
//}
//let john = Person(fullName: "John")
//print(john.fullName)
//
//print("=============== Protocol Requirements===============")
////property requiremments
////class @Starship adopting and conforming to @FullyNamed protocol
////computed read-only property @fullName can be used since the protocol
//    //is defined to be only gettable
////starship takes string varible @name and a optional string varible @prefix
//    //since prefix is optional, it will return nothing if its nil
//    //
//class Starship: FullyNamed{
//    var prefix: String?
//    var name: String
//
//    init(name: String, prefix: String? = nil) {
//        self.name = name
//        self.prefix = prefix
//
//    }
//
//    var fullName: String{
//        return (prefix != nil ? prefix! + " " : " ") + name
//    }
//}
//var shipName = Starship(name:"Enterprise",prefix: "USS" )
//print(shipName.fullName)
//
////method requirements
////type method are prefixed with @static keyword
////protocol methods cannot have bodies of statement

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

print("=============== Protocol used a type===============")
//@LinearCongruentialGenerator() and @RandomNumberGenerator delared above
//The protocol @RandomNumberGenerator is used as a type for @generator.

class Dice{
    var sides: Int
    var generator : RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int{
        return Int (generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5{
    print("Random dice roll is \(d6.roll())")
}

print("=============== DELEGATION ===============")
//Delegation
//Delegation is a design pattern that enables a class or structure to hand off(or delegate) some of its responsibilities to an instance of another type.

protocol DiceGame{
    var dice: Dice{get}
    func play()
}


protocol DiceGameDelegate: AnyObject{
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()
 
print("=============== Adding Protocol Conformance with an Extension ===============")

//This extension adopts the new protocol in exactly the same way as if Dice had provided it in its original implementation.
protocol TextRepresentable{
    var textualDescription: String {get}
}

extension Dice : TextRepresentable{
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)
//@SnakesAndLadders extending to adopt and conform @TextRepresnetable
extension SnakesAndLadders: TextRepresentable{
    var textualDescription: String{
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}
print(game.textualDescription)
