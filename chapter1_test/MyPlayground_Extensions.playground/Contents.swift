//: Playground - noun: a place where people can play

import UIKit

var str = "扩展（Extensions）"
    //Swift 中的扩展可以：
    //添加计算型属性和计算型类型属性
    //定义实例方法和类型方法
    //提供新的构造器
    //定义下标
    //定义和使用新的嵌套类型
    //使一个已有类型符合某个协议

//扩展语法
    //使用关键字 extension 来声明扩展：
    //
    //extension SomeType {
    //    // 为 SomeType 添加的新功能写到这里
    //}

//计算型属性
extension Double {
    var km: Double {
        return self * 1_000.0
    }
    var m: Double {
        return self
    }
    var cm: Double {
        return self / 100.0
    }
    var mm: Double {
        return self / 1_000.0
    }
    var ft: Double {
        return self / 3.28084
    }
}

let oneInch = 25.4.mm
let threeFeet = 3.ft
let aMarathon = 42.km + 195.m
    //扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。

//构造器
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center:Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin:Point(x: originX, y: originY),size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

//方法
extension Int {
    func repetitions(task:() -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions(task: {
    print("Hello!")
})

1.repetitions{
    print("Goodbye!")
}

    //可变实例方法（Mutating Instance Methods）
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someIntt = 3
someIntt.square()

//下标
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
1295[0]
1295[1]
1295[2]
1295[8]

//嵌套类型
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

func printIntergerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ",terminator:"")
        case .Zero:
            print("0 ",terminator:"")
        default:
            print("+ ",terminator:"")
        }
    }
}

printIntergerKinds(numbers: [3,19,-27,0,-6,0,7])
