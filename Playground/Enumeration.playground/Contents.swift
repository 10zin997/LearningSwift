import UIKit
//====================================================
//You can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed.
// think a category and a list : color :  red, green blue, yellow etc
//because swift's type inference , once the a varaible is declared to enum, no need to explicity declare the type :  var varaible = enum.case1 -> varaible = .case2
//====================================================
enum CompassPoint {
    case north
    case south
    case east
    case west
}
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// once its directionToHead is declared as CompassPoint,you can use dot syntax


var directionToHead = CompassPoint.north
directionToHead = .east
print(directionToHead)

//Matching Enumeration Values with a Switch Statement

directionToHead = .south
switch directionToHead{
    case .north: print("to the king of the north")
    case .south: print("nothing like sourthern hospitality")
    case .east : print("brace your self for the Nor'easter")
    case .west: print("west is the hollywood land")
}
let somePlanet = Planet.earth
switch somePlanet{
case .earth: print("mostly harmless")
default: print("not a safe place for humans")
}

enum Beverage: CaseIterable {
case coffee, tea , juice
}

let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
for beverage in Beverage.allCases {
    print(beverage)
}
//Implicitly Assigned Raw Values
//the implicit value for each case is one more than the previous case. If the first case doesn’t have a value set, its value is 0.
enum rawVal :Int{
    case num1 = 1 ,num2,num3,num4,num5,num6,num7,num8
}
let rawValOrder = rawVal.num2.rawValue

print(rawValOrder)
//==============
//=============
