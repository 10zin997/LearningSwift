import Foundation

struct Fahrenheit{
    var temperature : Double
    
    init() {
        temperature = 32.0
    }
}

let fahrenheit = Fahrenheit()

print("the default temperature is \(fahrenheit.temperature)")

struct Celsius{
    var tempInCelsius : Double
    init(fromFahrenheit fahrenheit : Double){
        tempInCelsius = (fahrenheit - 32) / 1.80
    }
    init(fromKelvin kelvin:Double) {
        tempInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        tempInCelsius = celsius - 273.15
    }
}
let boilingPoint = Celsius(fromFahrenheit: 212.0)
let freezingPoint = Celsius(fromKelvin: 273.15)
let roomTemp = Celsius(293.0)
print("the boiling point of water in C is \(boilingPoint)")
print("the freezing point of water in C is \(freezingPoint)")
print("the room temperature of water in C is \(roomTemp)")


//because initlizers dont use name in declaration, the parameters play an important
    //role to identify one init call from another
//when calling parameters, argument label must always be used in an initlizer if they are defined.

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
//let veryGreen = Color(0.0, 1.0, 0.0)                  //missing argument label.
print("this prints magenta = \(magenta)")
print("this prints gray =\(halfGray)")


//optional type

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."
cheeseQuestion.ask()
