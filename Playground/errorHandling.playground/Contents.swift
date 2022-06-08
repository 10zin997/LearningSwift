import UIKit
// enum = user defined data type that has fixed set of values
//in our case we create a CustomrError with protcol of Error
// which has three values : "invalid", "empty", "other"
enum CustomError : Error{
    case invalid
    case empty
    case other
}
func checkValid()   {
    let urlString = "https://www.10zinWangyal20.com"
    

do{
    let result = try validateUrl(urlString: urlString)
    
}catch{
    print(error)
    
}
}
func validateUrl(urlString: String) throws -> Bool {
    guard !urlString.isEmpty else{
        throw CustomError.empty
    }
    guard URL(string: urlString) != nil else{
        throw CustomError.invalid
    }
    throw CustomError.other
}
