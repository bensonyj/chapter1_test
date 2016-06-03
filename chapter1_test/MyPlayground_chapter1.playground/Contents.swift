//: Playground - noun: a place where people can play

import UIKit

//基础部分。2016.6.2

var str = "Hello, playground"
var weclomeMessage:String
weclomeMessage = "Hello"

let 😂 = "dog"
print(😂)

//数值型字面量
let decimalInteger = 17
let binaryInterger = 0b100011
let octalInterger = 0o21
let hexadecimalInteger = 0x11

let decimalDouble = 12.1875
let exponentDouble = 1.21875E2
let hexadecimalDouble = 0xC.3P0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//整数和浮点数转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine

//元组
let http404Error = (404,"Not Found")
let (statusCode,statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode:200,description:"OK")

//可选类型
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveryAnser:String?

if convertedNumber != nil{
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

//可选绑定
if var actualNumber = convertedNumber{
    actualNumber += 1
    print("\'\(possibleNumber)' has an integer value of \(actualNumber)")
}

if let firstNumber = Int("4"),secondNumber = Int("42") where firstNumber < secondNumber{
    print("\(firstNumber) < \(secondNumber)")
}

//隐式解析可选类型
let possibleString: String? = "An optional string"
let forcedString: String = possibleString!
let assumedString: String! = "An implicituly unwrapped optional string"
let implicitiString: String = assumedString

//使用断言进行调试
let age = 4
assert(age >= 0, "A person's age cannot be less than zero")




