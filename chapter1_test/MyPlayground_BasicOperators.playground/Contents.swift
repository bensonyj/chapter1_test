//: Playground - noun: a place where people can play

import UIKit

//基本运算符2016.6.2
var a = 2
a += 2
let b = a * 2

(1,"zebra") < (2,"apple")
(3,"apple",1) > (3,"bird",4)

//空合运算符（Nil Coalescing Operator）
let defaultColorName = "red"
var userDefinedColorName : String? = "green"
let colorNameToUse = userDefinedColorName ?? defaultColorName

for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}


