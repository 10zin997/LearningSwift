import Cocoa
//Write a Swift program to test whether a value presents sequentially three times in an array of //integers or not.

func testTriples(_ input : [Int])->Bool{
    for (index,number) in input.enumerated(){
        let secondIndex = index + 1
        let thirdIndex = index + 2
    
        if secondIndex < input.count && number == input[secondIndex] && number == input[thirdIndex] {
            return true
        }
    }
    return false
}
print(testTriples([1, 1, 1, 2, 2]))
print(testTriples([1, 1, 1, 2, 2, 2, 2]))
print(testTriples([1, 1, 3, 3, 1]))
