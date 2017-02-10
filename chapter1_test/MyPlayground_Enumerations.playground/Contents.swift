//: Playground - noun: a place where people can play

import UIKit

//枚举（Enumerations）

//枚举语法（Enumeration Syntax）
enum SomeEnumeration {
    //枚举定义放在这里
}

enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune
}

var directionToHead = CompassPoint.West
directionToHead = .East


//使用 Switch 语句匹配枚举值（Matching Enumeration Values with a Switch Statement）
directionToHead = .South
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case CompassPoint.South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

let somePlanet = Planet.Earth
switch somePlanet{
case .Earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

//关联值（Associated Values）
enum Barcode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABVDEFGHIJKLMNOP")

switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A:\(numberSystem),\(manufacturer),\(product),\(check).")
case .QRCode(let productCode):
    print("QR code:\(productCode)")
}

productBarcode = .UPCA(8, 85909, 51226, 3)
switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
    print("QR code: \(productCode).")
}

//原始值（Raw Values）
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

    //原始值的隐式赋值（Implicitly Assigned Raw Values）
enum Plant2: Int {
    case Mercury = 1,Venus, Earth, Mars, Jupiter, Saturn, Uranus,Neptune
}
let earthsOrder = Plant2.Earth.rawValue
let sunsetDirection = CompassPoint.West.hashValue

    //使用原始值初始化枚举实例（Initializing from a Raw Value）
let possiblePlanet = Plant2(rawValue: 7)

let positionToFind = 9
if let somePlanet2 = Plant2(rawValue: positionToFind) {
    switch somePlanet2 {
    case .Earth:
        print("<ostly harmless")
    default:
        print("Not a safe place for humans")
    }
}else {
    print("There isn't a planet at position \(positionToFind)")
}


//递归枚举（Recursive Enumerations）
enum ArithmeticExptression {
    case Number(Int)
    indirect case Addition(ArithmeticExptression,ArithmeticExptression)
    indirect case Multiplication(ArithmeticExptression,ArithmeticExptression)
}

let five = ArithmeticExptression.Number(5)
let four = ArithmeticExptression.Number(4)
let sum = ArithmeticExptression.Addition(five, four)
let product = ArithmeticExptression.Multiplication(sum, ArithmeticExptression.Number(2))

func evaluate(_ expression: ArithmeticExptression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))

