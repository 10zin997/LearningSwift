import Cocoa
import Darwin
print("=============Instance Methods=================")
//we call the first increment func and the counter increases by one.
    //then we give the increment with a parameter which takes in value of 5
    //5 gets added to the current count which is 1 which give count the value of 6
    //then we call reset which set count to 0
class Counter{
    var count = 0
    func increment()  {
        self.count += 1

    }
    func increment( amount : Int){
        self.count += amount
        print(count)
    }
    func reset(){
        count = 0
    }
}
let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.increment(amount: 5)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0

print("=============Self Property=================")
//there are two property with the name x
//the stored property in the structure is called x and the parameter
    //for the function is also x. So we use self.x in function to mean,that this
    //x comes from the parameter while the other x is from the stored property.

//struct Point{
//    var x = 0.0 , y = 0.0
//    func isToTheRight(x:Double) -> Bool {
//
//        print("this is self \(self.x)")
//        print("this is x \(x)")
//        return self.x > x
//    }
//}
//let somePoint = Point(x: 4.0, y: 5.0)
//if somePoint.isToTheRight(x:1){
//    print("This point is to the right of the line where x == 1.0")
//}

print("=============Modifying Value Types from Within Instance Methods=================")
//Structures and enumerations are value type, which means teh properties cants be modified within its //instance methods
//But you can however use mutation to modify within the
    //the method, any changes are revereted when method ends.
//struct Point {
//    var x = 0.0, y = 0.0
//    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
//        x += deltaX
//        y += deltaY
//    }
//}
//var somePoint = Point(x: 1.0, y: 1.0)
//print("The point is at (\(somePoint.x), \(somePoint.y))")
//somePoint.moveBy(x: 2.0, y: 3.0)
//print("The point is now at (\(somePoint.x), \(somePoint.y))")
print("=============Assigning to self Within a Mutating Method=================")
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}
var somePoint = Point(x: 1.0, y: 1.0)
print("The point is at (\(somePoint.x), \(somePoint.y))")
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

//Mutating methods for enumerations can set the implicit self parameter to be a different case from the same enumeration
//This example defines an enumeration for a three-state switch. The switch cycles between three different power states (off, low and high) every time its next() method is called.
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.high
ovenLight.next()
print(ovenLight)
ovenLight.next()
print(ovenLight)

