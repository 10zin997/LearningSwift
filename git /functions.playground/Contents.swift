import Foundation

//
func sayhelloworld()->String{
 return "Hello world!"
    
}
print (sayhelloworld())
//func with default parameter
func sayByeWorld(word : String = "Bye World!")->String{

   return word
    
}
print (sayByeWorld())

//
func greet(person : String ) -> String   {
    let greeting = "Hello,\(person)!"
    let greeting2 = "bye,\(person)!"
    let greeting3 = String (123) //error because return type is String
    //return "hola \(person)!" // making the body of the function shorter
    return greeting
   
   // return greeting2
}


// this is the input
// first print is called, then the function which has a parameter of "Amanda"
// this parameter is inputted in the function block above and when it retunrn
// the print is completed
print (greet(person: "Amanda"))
print (greet(person: "brian"))

//taking in two input and retunr 1 output
func greet2(person:String,  alreadyGreeted: Bool) -> String {
    if alreadyGreeted {         //no need to compare since the comparison is being inputted
        return "i said hi already"
    }else{
        return "hello, \(person)!"
        
    }
}

print(greet2(person: "Tenzin", alreadyGreeted : false))


// a function without return
//since it doesnt return function call gives the input to func3
// which print the body
// return type is void
func greet3(person:String){
    print("hello \(person)")
    
}
greet3(person: "Samantha")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
print(printAndCount(string: "this has 17 words"))

// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world")
// prints "hello, world" but doesn't return a value


//function with multipple return values
//the fucntion takes in array of numbers
//compares the value to put into variables
//and reutnr the smalltest and the largest val



func minMax(thisArray: [Int]) -> (min: Int , max: Int)?  {
    if thisArray.isEmpty{return nil}
    var currentMin = thisArray[0]
    var currentMax = thisArray[0]
    for tempVal in thisArray[0..<thisArray.count]{
        if tempVal < currentMin{
            currentMin = tempVal
        }else if tempVal > currentMax{
                    currentMax = tempVal
        }
        }
    return(currentMin,currentMax)
    }

// OPTIONAL BINDING
if let val = minMax(thisArray: [125,352,124,65757,124124124,65,3,0,12,20,4,6,121,645,1352,64,23,62,634,75]) {
    print("min is \(val.min) and max is \(val.max)")
}

//Varadiac parameters
//takes in zero or  multiple input
// three dots after the type
//example func add (addThis : Double...) -> Double

//func addThis can be rewriten as a reference to a varaible

func addThis(val1: Int,val2 :Int)-> Int{
    let result = val1 + val2
    return result
}
func multiplyThis(val1:Int,val2:Int)->Int{
    let result = val1 * val2
    return result
}
print (addThis(val1: 50,val2:50))


var varToFunc : (Int,Int)->Int = addThis
print("this variable points to addThis function \(varToFunc(5,5))")

varToFunc = multiplyThis
print("this varaible points to multiplyThis function \(varToFunc(10,2))")


//example of nested function which also has function as a return type

func chooseStepFunction(backward: Bool) -> (Int) -> Int { //inputted false so trigger stepforward condition
    print(backward)
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward     //return condition ? (if true) var1: (if false) var2
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0) //return false

// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
