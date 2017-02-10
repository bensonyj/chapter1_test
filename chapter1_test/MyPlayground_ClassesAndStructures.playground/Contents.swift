//: Playground - noun: a place where people can play

import UIKit

//类和结构体（Classes and Structures）

//类和结构体对比
    //定义语法
    //类和结构体有着类似的定义方式。我们通过关键字class和struct来分别表示类和结构体
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name : String?
}

    //类和结构体实例
let someResolution = Resolution()
let someVideoMode = VideoMode()

    //属性访问
print("The width of someResolution is \(someResolution.width)")

    //结构体类型的成员逐一构造器（Memberwise Initializers for Structure Types）
let vga = Resolution(width: 640, height: 480)

//结构体和枚举是值类型
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("Ciname is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

enum CompassPoint {
    case North, South,East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
}

//类是引用类型
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenTighty = tenEighty
alsoTenTighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

    //恒等运算符
if tenEighty === alsoTenTighty {
    print("tenEughty and alsoTenEighty refer to the same Resolution instance.")
}

    //指针
    //如果你有 C，C++ 或者 Objective-C 语言的经验，那么你也许会知道这些语言使用指针来引用内存中的地址。一个引用某个引用类型实例的 Swift 常量或者变量，与 C 语言中的指针类似，但是并不直接指向某个内存地址，也不要求你使用星号（*）来表明你在创建一个引用。Swift 中的这些引用与其它的常量或变量的定义方式相同。

//类和结构体的选择

    //按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
    //
    //该数据结构的主要目的是用来封装少量相关简单数据值。
    //有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
    //该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
    //该数据结构不需要去继承另一个既有类型的属性或者行为。
    //举例来说，以下情境中适合使用结构体：
    //
    //几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
    //一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
    //三维坐标系内一点，封装x，y和z属性，三者均为Double类型。
    //在所有其它案例中，定义一个类，生成一个它的实例，并通过引用来管理和传递。实际中，这意味着绝大部分的自定义数据构造都应该是类，而非结构体。

//字符串(String)、数组(Array)、和字典(Dictionary)类型的赋值与复制行为
