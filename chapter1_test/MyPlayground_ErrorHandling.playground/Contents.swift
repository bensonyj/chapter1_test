//: Playground - noun: a place where people can play

import UIKit

//错误处理（Error Handling）

//表示并抛出错误
    //在 Swift 中，错误用符合ErrorType协议的类型的值来表示。这个空协议表明该类型可以用于错误处理。
enum VendingMachineError: ErrorType {
    case InvalidSelection                       //选择无效
    case InsufficientFunds(coinsNeeded: Int)    //金额不足
    case OutOfStock                             //缺货
}

throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)

//处理错误
    //用 throwing 函数传递错误
//func canThrowErrors() throws -> String
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name :String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        dispenseSnack(name)
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"
]
func buyFavoriteSnack(person: String,vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

let vendingTest = VendingMachine.init()
try buyFavoriteSnack("Bob", vendingMachine: vendingTest)



struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}
    //用 Do-Catch 处理错误
//do {
//    try expression
//    statements
//} catch pattern 1 {
//    statements
//} catch pattern 2 where condition {
//    statements
//}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("Invalid selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of stock.")
}catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds.Please insert an additional \(coinsNeeded) coins.")
}

    //将错误转换成可选值
//func someThrowingFunction() throws -> Int {
//    // ...
//}
//
//let x = try? someThrowingFunction()
//
//let y: Int?
//do {
//    y = try someThrowingFunction()
//} catch {
//    y = nil
//}

    //禁用错误传递
//有时你知道某个 throwing 函数实际上在运行时是不会抛出错误的，在这种情况下，你可以在表达式前面写try!来禁用错误传递，这会把调用包装在一个不会有错误抛出的运行时断言中。如果真的抛出了错误，你会得到一个运行时错误。
//let photo = try! loadImage("./Resources/John Appleseed.jpg")


//指定清理操作
//func processFile(filename: String) throws {
//    if exists(filename) {
//        let file = open(filename)
//        defer {
//            close(file)
//        }
//        
//        while let line = try file.readline() {
//            //
//        }
//    }
//}
