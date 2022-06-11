//import UIKit
import Foundation

//Optionals

var x : Int? = 3
var y : Int? = nil
var z : Int? = 4
var omega : Int! = 4
var alpha : Int! = 3

    print ("this is nil coalesce \((x ?? 0) + (y ?? 4))") // if y = nil, give it the value of 4

print("this is force unwrapping \(x! + z!)")
//print(y!) // will give error since y has the value of nil
            // dangerous to use and will give fatal error, use only when 100% sure of value

if let val1 = x , let val2 = z {
    
    print ("this is binding \(val1 + val2)" )

}else{
   print("no value , Function: \(#function), line: \(#line)")
}
    
print(omega + alpha)



