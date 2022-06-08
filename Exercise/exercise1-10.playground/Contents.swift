//https://www.w3resource.com
//exercise 1 - 10

import Foundation
print("========equalSum=========")
//Write a Swift program to compute the sum of the two integers. If the values are equal return the triple their sum.
func equalSum(num1 : Int , num2: Int)-> Int{
    if num1 == num2{
    return 3 * (num1 + num2)
    }else{
        return num1 + num2
    }
}
print(equalSum(num1: 3, num2: 2))

print("========absDifference=========")
//Write a Swift program to compute and return the absolute difference of n and 51, if n is over 51 return double the absolute difference.
func absDifference(num: Int) -> Int {
    if num > 51 {
       return abs (2 * (num - 51))
    }else{
        return abs(num - 51)
    }
}
print(absDifference(num: 45))
print(absDifference(num: 61))
print(absDifference(num: 21))

print("========twenty=========")
//Write a Swift program that accept two integer values and return true if one of them is 20 or if their sum is 20.
func twenty(num1: Int, num2:  Int)->Bool{
    if num1 == 20 || num2 == 20 || num1 + num2 == 20{
        return true
    }else{
        return false
    }
}
print(twenty(num1: 30, num2: 30))
print(twenty(num1: 0, num2: 20))
print(twenty(num1: 15, num2: 5))

print("========testNum=========")
//Write a Swift program to accept two integer values and return true if one is negative and one is positive. Return true only if both are negative.

func testNum(num1 : Int , num2: Int) -> Bool {
    if num1 < 0 && num2 > 0 || num1 < 0 && num2 < 0{
        return true
    }else if num1 > 0 && num2 < 0{
        return true
    }else{
        return false
    }
}
print(testNum(num1:12, num2:-5))
print(testNum(num1:-12, num2:5))
print(testNum(num1:-12, num2:-5))
print(testNum(num1:12, num2:5))

print("========add a String=========")
//Write a Swift program to add "Is" to the front of a given string. However, if the string already begins with "Is", return the given string
//using hasPrefix becuase we want the is infront of the string
//else word.contains(word) works as well
func isAIsString (word : String) ->String{
    if word.hasPrefix("Is"){
       return word
    }else {
        return "Is " + word
    }
}
print(isAIsString(word: "Swift"))
print(isAIsString(word: "Is Swift"))


print("========remove a String=========")
//Write a Swift program to remove a character at specified index of a given non-empty string. The value of the specified index will be in the range 0..str.length()-1 inclusive.

func removeString (word: String, inThisIndex: Int) -> String {

    var newWord = word
    let index = word.index(word.startIndex, offsetBy: inThisIndex)
    if  word != ""
    {
        newWord.remove(at: index)
    }
    return newWord
}
print("The word went from Tenzzin to \( removeString(word: "Tenzzin", inThisIndex: 3))")
print("The word went from mWangyal to \( removeString(word: "mWangyal", inThisIndex: 0))")

print("========switch first and last string=========")
//Write a Swift program to change the first and last character of a given string.
   
func swapString(word: String) -> String {
    if word.count > 1{
    var resultWord = word
    let lastStr = String(resultWord.removeLast())
    return lastStr + word + lastStr
    }else{
        return "error: few words"
    }
}
print(swapString(word: "swift"))
print(swapString(word: "html"))
print(swapString(word: "h"))


print("========multiple of 3 or 5=========")
//Write a Swift program to check if a given non-negative number is a multiple of 3 or a multiple of 5.
func test35 (num: Int)-> Bool{
    if num > 0 && num % 3 == 0 || num % 5 == 0{
        return true
    }
    else{
        return false
    }
}

print(test35(num: 33))
print(test35(num: 100))
print(test35(num: 15))
print(test35(num: 17))

print("========add first 2 char to both end========")
//Write a Swift program to take the first two characters from a given string and create a new string with the two characters added at both the front and back.
func frontBack(word : String) -> String {
    let lastChar = word.prefix(2)
    return lastChar + word + lastChar
}
print(frontBack(word: "SWIFT"))
print(frontBack(word: "abc"))
print(frontBack(word: "AB"))
print(frontBack(word: "A"))

