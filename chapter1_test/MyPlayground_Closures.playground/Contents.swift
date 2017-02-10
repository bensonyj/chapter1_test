//: Playground - noun: a place where people can play

import UIKit

//闭包（Closures）

//闭包表达式（Closure Expressions）
    //sort 方法（The Sort Method）
let names = ["Chirs","Alex","Ewa","Barry","Daniella"]

func backwards(s1: String,s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sorted(by: backwards)

    //闭包表达式语法（Closure Expression Syntax）
    //{ (parameters) -> returnType in
    //    statements
    //}
reversed = names.sorted(by: {
    (s1:String,s2: String) -> Bool in
    return s1 > s2
})

    //根据上下文推断类型（Inferring Type From Context）
reversed = names.sorted(by:{s1, s2 in return s1 > s2})

    //单表达式闭包隐式返回（Implicit Return From Single-Expression Clossures）
reversed = names.sorted(by:{ s1, s2 in s1 > s2})

    //参数名称缩写（Shorthand Argument Names）
reversed = names.sorted(by:{$0 > $1})

    //运算符函数（Operator Functions）
reversed = names.sorted(by:>)


//尾随闭包（Trailing Closures）
    //func someFunctionThatTakesAClosure(closure: () -> Void) {
    //    // 函数体部分
    //}
    //
    //// 以下是不使用尾随闭包进行函数调用
    //someFunctionThatTakesAClosure({
    //    // 闭包主体部分
    //})
    //
    //// 以下是使用尾随闭包进行函数调用
    //someFunctionThatTakesAClosure() {
    //    // 闭包主体部分
    //}
reversed = names.sorted(){ $0 > $1}
reversed = names.sorted { $0 > $1}

let digitNames = [0:"Zero",1:"One",2: "Two",3: "Three",4: "Four",5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"]
let numbers = [16,58,510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}


//值捕获（Capturing Values）

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let  incrementBySeven = makeIncrementor(forIncrement: 7)
incrementBySeven()

incrementByTen()

//闭包是引用类型（Closures Are Reference Types）
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()


//非逃逸闭包(Nonescaping Closures)

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler:@escaping ()-> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure:() -> Void){
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure () {self.x = 100}
        someFunctionWithNonescapingClosure {x = 200}
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

//自动闭包（Autoclosures）
var customersInLine = ["Chris","Alex","Ewa","Barry","Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")
print(customersInLine.count)

func serveCustomer(_ customerProvider2:() -> String)  {
    print("Now serving \(customerProvider2())")
}
serveCustomer({customersInLine.remove(at: 0)})

func serveCustomer3(_ customerProvider3: @autoclosure () -> String){
    print("Now serving \(customerProvider3())!")
}
serveCustomer3(customersInLine.remove(at: 0))


var customerProviders:[() -> String] = []
func collectCustomerProviders(_ customerProvider4: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider4)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
for customerProvider5 in customerProviders {
    print("Now serving \(customerProvider5())!")
}


