import Foundation
//=====================================================
//Struct Vs. Class
//=====================================================
// similar definition syntax
struct ResolutionStruct{
    var width = 20
    var height = 70
}
//resolution, is initialized with a new ResolutionStruct structure instance, which infers a property type of ResolutionStruct.
class VideoModeClass{
    var resolution = ResolutionStruct()
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    
}
//similar syntax to create instances

let resolutionConst = ResolutionStruct()
let videoModeConst = VideoModeClass()

// access properties
print("The width of resolutionConst is \(resolutionConst.width)")
print("The height of resolutionConst is \(resolutionConst.height)")
print(ResolutionStruct())
print("The width of resolutionConst is \(ResolutionStruct().width)")
print("The height of resolutionConst is \(ResolutionStruct().height)")
//You can drill down into subproperties, such as the width property in the resolution property of a VideoModeClass
print("the width of videoModeConst \(videoModeConst.resolution.width)")
videoModeConst.resolution.width = 25
print("the width of videoModeConst \(videoModeConst.resolution.width)")
//structure has automatically generated Memberwise Intializer
// type in ResolutionStruct( and recomendation pops up (only struct
let vga = ResolutionStruct(width: 640, height: 640)


//=====================================================
//value types
//Structures and Enumerations Are Value Types
// Acessing and changing values
// value type are type that are copied when assigned to
    //variable and cosnt or when passed around in functions
//=====================================================
//thought the width property of cinema is changed,the width property
    // or original hd remains the same.So cinema copies the width from hd, and cinema copies adn changes it, the orignal will have the same old value while cinema has a new one.
let hd = ResolutionStruct(width: 1920, height: 1080)
var cinema = hd
print("this is the width of hd \(hd.width)")
print("this is the width of cinema \(cinema.width)")
cinema.width = 2048
print("this is the new width of cinema \(cinema.width)")
print("this is the width of hd \(hd.width)")
//another example using enumerations
enum CompassPoint {
case north,south,east,west
    mutating func turnNorth(){
        self = .north
    }
}
var currentDirection = CompassPoint.west
let copyCurrentDirection = currentDirection
currentDirection.turnNorth()
print(currentDirection)
print(copyCurrentDirection)

//=====================================================
//reference type
//=====================================================
//we use the VideoModeClass() defined above
// since class are reference type, they refer to the insatnce of the class.i this example the old tenEighty.framerate referes to current a framerate of 25,and later we change so that alsoTenEighty.framerate refers to 30. since its a reference type both of the refers to the new value of framerate.
//also note that both tenEight and alsoTenEighty is constant, but they were able to change
//the actual value of tenEighty and alsoTenEighty doesnt change becuase they dont store the value of videoModeClass they just refer to it.its the framerate of videoModeClass thats being changed
let tenEighty = VideoModeClass()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print(tenEighty.frameRate)
print(alsoTenEighty.frameRate)

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
