//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)

let label = "The width is"
let width = 95
let widthLabel = label + String(width)
let widthLabel2 = "I was \(width)"
let widthLabel3 = label + widthLabel2
let widthLabel4 = "this is4 \(widthLabel)"
let foloat = 3.333
let foloatStrong = "hello \(foloat)"

var shoppingList = ["catfish","water","tulips",]
shoppingList[1] = "bottle of water"
shoppingList.append("blue paint2")
shoppingList[3] = "blue paint"
print(shoppingList)

var optionalString:String? = "hello"
print(optionalString == nil)
var optionalName:String? = nil//"John Apple"
var greeting = "Hello!"
if let name = optionalName{
    greeting = "Hello,\(name)"
}else{
    greeting = "Sorry"
}

let interestingNumbers = ["Prime":[2,3,5,7,11,13],"Fibonacci":[1,1,2,3,5,8],"Square":[1,4,9,16,25]]

var largest = 0
for (kind,numbers) in interestingNumbers{
    for number in numbers{
        if number > largest{
            largest = number
        }
    }
}
print(largest)

var m = 2
repeat{
    m = m * 2
}while m < 100
print(m)

var  firstForLoop = 0

for i in 0 ... 100{
    firstForLoop += i
}
print(firstForLoop)

func greet(name:String,day: String) -> String {
    return "Hello \(name),today is \(day)"
}

greet("Yingjian", day: "monday")

func calculateStatistics(scores:[Int]) -> (min: Int,max: Int,sum:Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score < min {
            min = score
        }else if score > max{
            max = score
        }
        
        sum += score
    }
    
    return(min,max,sum)
}

let  statistics = calculateStatistics([5,3,100,3,9])
print(statistics.sum)
print(statistics.1)
calculateStatistics([Int()])


func sumOf(numbers:Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    
    return sum
}

sumOf()
sumOf(42,597,12)

func returnFifteen() -> Int {
    var y = 10
    
    func add(){
        y += 5
    }
    
    add()
    return y
}

returnFifteen()

func makeIncrementer() -> (Int -> Int) {
    func addOne(number:Int) -> Int{
        return 1 + number
    }
    
    return addOne
}

var incrementer = makeIncrementer()
incrementer(7)

func hasAnyMatches(list:[Int],condition:Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number : Int) -> Bool {
    return number < 10
}

var numbers = [20,19,7,12]
hasAnyMatches(numbers, condition: lessThanTen)

numbers.map { (number : Int) -> Int in
    let result = 3 * number
    return result
}

numbers.map { (number : Int) -> Int in
    var reslut = 0
    if number % 2 != 0{
        reslut = number
    }
    
    return reslut
}
print(numbers.map { (number : Int) -> Int in
    var reslut = 0
    if number % 2 == 0{
        reslut = number
    }
    
    return reslut
    }
)

let mappedNumbers = numbers.map ({number in 3 * number})
print(mappedNumbers)

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape{
    var numberOfSides : Int = 0
    var name: String
    
    init(name : String){
        self.name = name
    }
    
    func simpleDscription() -> String {
        return "A simple with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double,name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDscription() -> String {
        return "A square with sides of length \(sideLength) sides."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDscription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    init(sideLength: Double,name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double{
        get{
            return 30*sideLength
        }
        set{
            sideLength = newValue/3.0
        }
    }
    
    override func simpleDscription() -> String {
        return "A equlateral traigle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)
print(triangle.perimeter)

enum Rank: Int {
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let  ace = Rank.Ace
let aceRawValue = ace.rawValue

func compareNumber(number1:Rank,number2:Rank) -> String {
    if number1.rawValue > number2.rawValue {
        return "number1" + String(number1.rawValue)
    }else{
        return "number2" + String(number2.rawValue)
    }
}

let  two = Rank.Two
compareNumber(ace, number2: two)

if let convertedRank = Rank(rawValue: 11) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case Spades,Hearts,Diamonds,Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "doamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades,.Clubs:
            return "black"
        default:
            return "red"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

enum ServerResponse {
    case Result(String,String)
    case Error(String)
}

let success = ServerResponse.Result("6.00 am", "8.09 pm")
let failure = ServerResponse.Error("out of cheese")
switch success{
case let .Result(sunrise,sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)"
case let .Error(error):
    let serverResponse = "Failure ... \(error)"
}

protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}
var b = SimpleStruct()
b.adjust()
let bDescription = b.simpleDescription

//enum SimpleEnum : ExampleProtocol{
//    case simple
//    case normal
//    
////    var simpleDescription: String = "A simple enum"
//    mutating func adjust() {
//        switch self {
//        case .simple:
//            simpleDescription += "enmu adjusted"
//        default:
//            simpleDescription += "(adjusted)"
//        }
//    }
//}
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

//extension Double: ExampleProtocol {
//    var simpleDescription: String{
//        return "The absoluteValue is \(self)"
//    }
//}

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty)

func repeatltem<Item>(item:Item,numberOfTimes:Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    
    return result
}
repeatltem("knock", numberOfTimes: 4)

enum OptionaValue<Wrapped> {
    case None
    case Some(Wrapped)
}
var possibleInteger:OptionaValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements<T:SequenceType,U:SequenceType where T.Generator.Element:Equatable,T.Generator.Element == U.Generator.Element>(Ihs:T,_rhs:U) -> Bool {
    for IhsItem in Ihs {
        for rhsItem in _rhs {
            if IhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1,2,3], _rhs: [3])
