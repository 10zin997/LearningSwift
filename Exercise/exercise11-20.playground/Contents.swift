import Foundation
print ("===============Find is===============")
//Write a Swift program to test a given string whether it starts with "Is". Return true or false.
func findIs(word: String)-> Bool{
    let isIsThere = word.prefix(2)
    if isIsThere == "Is"{
        return true
    }else {
        return false
    }
}
print(findIs(word: "Is a me Mario"))
print(findIs(word: "me is a  Luigi"))

print ("===============is it between 2 numbers===============")
//Write a Swift program that return true if either of two given integers is in the range 10..30 inclusive.

func inBetween1030(num1: Int, num2 : Int) -> Bool{
    if num1 >= 10 && num1 <= 30 || num2 >= 10 && num2 <= 30{
        return true
    }
    else{
        return false
    }
}
print(inBetween1030(num1: 40, num2: 50))
print(inBetween1030(num1: 15, num2: 50))
print(inBetween1030(num1: 40, num2: 25))
print(inBetween1030(num1: 30, num2: 50))

print ("===============is word == fix===============")
//Write a Swift program to check if a given string begins with "fix", except the 'f' can be any character or number.
func findFix(word:String) ->Bool{
    var isItFix = word.prefix(3)
    _ = isItFix.removeFirst()
    if isItFix == "ix"{
        return true
    }else{
        return false
    }
}

print(findFix(word: "fix this shit"))
print(findFix(word: "dont fix this shit"))
print(findFix(word: "sixty"))
print(findFix(word: "5ixy"))

print ("===============find largest==============")
//Write a Swift program to find the largest number among three given integers.

func findLargest(num1: Int,num2: Int,num3: Int) ->Int{
    
    if num1>num2 && num1>num3{
        return num1
    }else if num2>num1 && num2>num3{
        return num2
    }else{
        return num3
    }
}

print(findLargest(num1: 25, num2: 32, num3: 64))
print(findLargest(num1: 305, num2: 52, num3: 104))
print(findLargest(num1: 305, num2: 1232, num3: 104))
