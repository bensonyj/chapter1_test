//: Playground - noun: a place where people can play

import UIKit

//方法（Methods）

//实例方法(Instance Methods)
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(_ amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()

    //方法的局部参数名称和外部参数名称 (Local and External Parameter Names for Methods)


    //修改方法的外部参数名称(Modifying External Parameter Name Behavior for Methods)

    //self 属性(The self Property)
struct Point {
    var x = 0.0,y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(x:1.0){
    print("This point is to the right of the line where x == 1.0")
}

    //在实例方法中修改值类型(Modifying Value Types from Within Instance Methods)
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX:Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
print("The point is now at (\(somePoint2.x),\(somePoint2.y))")
somePoint2.moveByX(x: 2, y: 3.0)
print("The point is now at (\(somePoint2.x),\(somePoint2.y))")

//let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveByX(2.0, y: 3.0)
// 这里将会报告一个错误

    //在可变方法中给 self 赋值(Assigning to self Within a Mutating Method)
struct Point3 {
    var x = 0.0,y = 0.0
    mutating func moveByX(x deltaX:Double,y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}
var somePoint3 = Point3(x: 1.0, y: 1.0)
print("The point is now at (\(somePoint3.x),\(somePoint3.y))")
somePoint3.moveByX(x: 2, y: 3.0)
print("The point is now at (\(somePoint3.x),\(somePoint3.y))")

enum TriStateSwitch {
    case Off,Low,High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()

//类型方法(Type Methods)
class SomeClass {
    class func someTypeMethod() {
        print("type method implementation goes here")
    }
}

SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func levelIsUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(_ level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        }else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    func completedLevel(_ level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Yingjian")
player.completedLevel(1)
print("\(player.playerName) highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "zxx")
if player.tracker.advanceToLevel(6){
    print("\(player.playerName) is now on level 6")
}else {
    print("\(player.playerName) level 6 has not yet been unlocked")
}
