import Foundation
//===========================================================
//
//===========================================================
let closureexample={(word:String)-> String in
    (print("Swift Closures"))
    let greeting = "hello \(word)"
    return greeting
    
}
print(closureexample("biatch"))
//===========================================================
//
//===========================================================


let multiply = {(val1:Int, val2:Int)-> Int in
    return val1 * val2
}
var result = multiply(10,20)
print (result)

//===========================================================
//regular function vs closure function
//regular has at least 5 lines of code
//closure has only 3 lines
//shorter has ommited some unnecessary code
//ultimately use closure if its easy to understand for reader
//so you can make your code explicit by incloduing the return type- and parameter type for the reader to understand easier
// many ways to write closure
//===========================================================

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]


func backward(_ s1 : String,_ s2: String) -> Bool {
    return s1 > s2
}
var reversedNamesFunction = names.sorted(by: backward)
print("this is from Function \(reversedNamesFunction)")

//Closure
var reversedNamesClosure = names.sorted(by:{ (s1: String, s2: String)-> Bool in return s1>s2 })
print("this is from Closure \(reversedNamesClosure)")

//shortened closure by inferring type from context
//paramter type and retunr type is ommited since its thier type are inffered from the array and the body
//since its a single expression we can also remove the keyword return
var shorterClosure = names.sorted(by:{ s1, s2 in s1 > s2 })
print("this is shorter Closure \(shorterClosure)")


//shorthand method
//in shorthand argument name, the type is inffered from the function type
//the number determines the the numeber of arguments
// the "in" keyword can be ommited since its just the body
//$0 and $1 represent first and second string argument
//type is infered
var shorthandClosure = names.sorted(by:{ $0 > $1 })
print("shorthand argument name Closure \(shorthandClosure)")

//operator method

var operatormethodClosure = names.sorted(by: >)
print("operator method closure \(operatormethodClosure)")

//===========================================================
//Trailing closure
//
//===========================================================
//dictionairy:(Int:String) and array:[Int]
//map(_:) = Returns an array containing the results of mapping the given closure over the sequence’s elements
//.map bascially transform an array into a different form of array
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16,52,76,213]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)
//===========================================================
//CAPTURE values
//a closure can capture contatnts and varible from surrounding code blocks
//===========================================================
// the simplest form of closure to capture values is nested functions

//the incrementer(), though doesnt have any variable called
//runningTotal or amount, it still refrences it because its CAPTURES
//a reference to runningTotal and amount from its surrounding

//note how to call the nested functions

//different fucntion call = different stored reference
// so each call has its own seprate incrementer

//note even though the incrementByTen and incrementBySeven are
// constant they can be changed becuase function and closure are
//reference types
//which means if one of the increment is assigned to another then
//they both refer to the same closure, so returning same runningtotal
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
let incrementBySeven = makeIncrementer(forIncrement: 7)
let alsoIncrementByTen = incrementByTen
print (incrementByTen())
print (incrementByTen())
print (incrementByTen())
print (incrementBySeven())
print (incrementBySeven())
print ( alsoIncrementByTen())
// returns a value of 50
print ( incrementByTen())
// returns a value of 60

//===========================================================
//ESCAPING closure
// use escaping keyword
//A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns.
//
//===========================================================
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)


completionHandlers.first?()
print(instance.x)

