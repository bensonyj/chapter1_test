//: Playground - noun: a place where people can play

import UIKit

//函数（Functions）

//函数的定义与调用（Defining and Calling Functions）
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

print(sayHello(personName: "Anna"))
print(sayHello(personName: "Brian"))

func sayHelloAgain(personName:String) -> String {
    return "Hell0, " + personName + "!"
}

//函数参数与返回值（Function Parameters and Return Values）
//无参函数（Functions Without Parameters）
func sayHelloWord() -> String {
    return "hello.world"
}

//多参数函数 (Functions With Multiple Parameters)
func sayHello(personName:String,alreadyGreeted:Bool) -> String {
    if alreadyGreeted {
        return sayHelloAgain(personName: personName)
    }else{
        return sayHello(personName: personName)
    }
}

print(sayHello(personName: "Tim", alreadyGreeted: true))

//无返回值函数（Functions Without Return Values）
func syaGoodbye(personName:String) {
    print("Goodbye, \(personName)!")
}

syaGoodbye(personName: "Dave")

//多重返回值函数（Functions with Multiple Return Values）
func minMax(array:[Int]) -> (min:Int,max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    
    return (currentMin,currentMax)
}
let bounds = minMax(array: [8,-6,2,109,3,71])
print("min is \(bounds.min) and max is \(bounds.max)")

//可选元组返回类型(Optional Tuple Return Types)
func minMax2(array:[Int]) -> (min:Int,max: Int)? {
    if array.isEmpty {
        return nil
    }
    
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    
    return (currentMin,currentMax)
}
if let bounds2 = minMax2(array: [8,-6,2,109,3,71]) {
    print("min is \(bounds2.min) and max is \(bounds2.max)")
}

//函数参数名称（Function Parameter Names）
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}
someFunction(firstParameterName: 1, secondParameterName: 2)

//指定外部参数名（Specifying External Parameter Names）
func sayHello(x person: String, anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)"
}
print(sayHello(x: "Bill", anotherPerson: "Ted"))

//忽略外部参数名（Omitting External Parameter Names）
func someFunction(firstParameterName: Int, _ secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}
someFunction(firstParameterName: 1, 2)

//默认参数值（Default Parameter Values）
func someFunction(parameterWithDefault: Int = 12) {
    // function body goes here
    // if no arguments are passed to the function call,
    // value of parameterWithDefault is 12
    print("parameterWithDefault is \(parameterWithDefault)")
}
someFunction(parameterWithDefault: 6) // parameterWithDefault is 6
someFunction() // parameterWithDefault is 12

//可变参数（Variadic Parameters）
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    
    return total / Double(numbers.count)
}
arithmeticMean(numbers: 1,2,3,4,5)
arithmeticMean(numbers: 3,8.25,18.75)

//输入输出参数（In-Out Parameters）
func swapTwoInts(_ a: inout Int, _ b:inout Int) {
    let  temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and another is now \(anotherInt)")

//函数类型（Function Types）
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

func printHelloWorld() -> () {
    print("hello,world")
}

let world = printHelloWorld

//使用函数类型（Using Function Types）
var mathFunction: (Int,Int) -> Int = addTwoInts
print("Result: \(mathFunction(2,3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2,3))")

let anotherMathFunction = addTwoInts

//函数类型作为参数类型（Function Types as Parameter Types）
func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}
printMathResult(mathFunction: addTwoInts, 3, 5)

//函数类型作为返回类型（Function Types as Return Types）
func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(_ backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

//嵌套函数（Nested Functions）
func chooseStepFunction2(_ backwards: Bool) -> (Int) -> Int {
    func stepForward2(input: Int) -> Int {
        return input + 1
    }
    func stepBackward2(input: Int) -> Int {
        return input - 1
    }
    
    return backwards ? stepBackward2 : stepForward2
}

currentValue = -4
let  moveNearerToZero2 = chooseStepFunction2(currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero2(currentValue)
}
print("zero!")

