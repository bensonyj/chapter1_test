//: Playground - noun: a place where people can play

import Cocoa

var str = "协议（Protocols）"

//协议语法（Protocol Syntax）
    //protocol SomeProtocol {
    //    //这里是协议的定义部分
    //}

    //要让自定义类型采纳某个协议，在定义类型时，需要在类型名称后加上协议名称，中间以冒号（:）分隔。采纳多个协议时，各协议之间用逗号（,）分隔：
    //
    //struct SomeStructure: FirstProtocol, AnotherProtocol {
    //    // 这里是结构体的定义部分
    //}
    //拥有父类的类在采纳协议时，应该将父类名放在协议名之前，以逗号分隔：
    //
    //class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
    //    // 这里是类的定义部分
    //}

//属性要求（Property Requirements）
    //协议总是用 var 关键字来声明变量属性，在类型声明后加上 { set get } 来表示属性是可读可写的，可读属性则用 { get } 来表示：
    //
    //protocol SomeProtocol {
    //    var mustBeSettable: Int { get set }
    //    var doesNotNeedToBeSettable: Int { get }
    //}
protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " ":"") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)

//方法要求（Method Requirements）
    //正如属性要求中所述，在协议中定义类方法的时候，总是使用 static 关键字作为前缀。当类类型采纳协议时，除了 static 关键字，还可以使用 class 关键字作为前缀：
    //
    //protocol SomeProtocol {
    //    static func someTypeMethod()
    //}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")

//Mutating 方法要求（Mutating Method Requirements）
protocol Togglabel {
    mutating func toggle()
}

enum OnOffSwitch: Togglabel {
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        default:
            self = .Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

//构造器要求（Initializer Requirements）
    //协议可以要求采纳协议的类型实现指定的构造器。你可以像编写普通构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体：
    //
    //protocol SomeProtocol {
    //    init(someParameter: Int)
    //}

    //构造器要求在类中的实现
    //如果一个子类重写了父类的指定构造器，并且该构造器满足了某个协议的要求，那么该构造器的实现需要同时标注 required 和 override 修饰符：
    //
    //protocol SomeProtocol {
    //    init()
    //}
    //
    //class SomeSuperClass {
    //    init() {
    //        // 这里是构造器的实现部分
    //    }
    //}
    //
    //class SomeSubClass: SomeSuperClass, SomeProtocol {
    //    // 因为采纳协议，需要加上 required
    //    // 因为继承自父类，需要加上 override
    //    required override init() {
    //        // 这里是构造器的实现部分
    //    }
    //}

    //可失败构造器要求

//协议作为类型（Protocols as Types）
    //协议可以像其他普通类型一样使用，使用场景如下：
    //
    //作为函数、方法或构造器中的参数类型或返回值类型
    //作为常量、变量或属性的类型
    //作为数组、字典或其他容器中的元素类型

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

//委托（代理）模式（Delegation）
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(game:DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll:Int)
    func gameDidEnd(game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice: Dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](count: finalSquare + 1, repeatedValue:0)
        board[03] = +8 ; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -2; board[24] = -8
    }
    
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTruns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTruns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTruns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTruns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()


//通过扩展添加协议一致性（Adding Protocol Conformance with an Extension）
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides) sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)
print(d6.textualDescription)

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and ladders with \(finalSquare) squares"
    }
}
print(game.textualDescription)

//通过扩展采纳协议（Declaring Protocol Adoption with an Extension）
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

let simonTehHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTehHamster
print(somethingTextRepresentable.textualDescription)

//协议类型的集合（Collections of Protocol Types）
let things: [TextRepresentable] = [game, d12, simonTehHamster]
for thing in things {
    print(thing.textualDescription)
}

//协议的继承（Protocol Inheritance）
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}
print(game.prettyTextualDescription)

//类类型专属协议（Class-Only Protocol）
    //你可以在协议的继承列表中，通过添加 class 关键字来限制协议只能被类类型采纳，而结构体或枚举不能采纳该协议。class 关键字必须第一个出现在协议的继承列表中，在其他继承的协议之前：

    //protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
    //    
    //}

//协议合成（Protocol Composition）
    //有时候需要同时采纳多个协议，你可以将多个协议采用 protocol<SomeProtocol, AnotherProtocol> 这样的格式进行组合，称为 协议合成（protocol composition）。你可以在 <> 中罗列任意多个你想要采纳的协议，以逗号分隔

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person2: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(celebrator: protocol<Named,Aged>) {
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}
let birthdayPerson = Person2(name: "Malcolm", age: 21)
wishHappyBirthday(birthdayPerson)

//检查协议一致性（Checking for Protocol Conformance）
    //你可以使用类型转换中描述的 is 和 as 操作符来检查协议一致性，即是否符合某协议，并且可以转换到指定的协议类型。检查和转换到某个协议类型在语法上和类型的检查和转换完全相同：
    //    
    //    is 用来检查实例是否符合某个协议，若符合则返回 true，否则返回 false。
    //        as? 返回一个可选值，当实例符合某个协议时，返回类型为协议类型的可选值，否则返回 nil。
    //            as! 将实例强制向下转换到某个协议类型，如果强转失败，会引发运行时错误。

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double {
        return pi * radius * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
}
class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects:[AnyObject] = [Circle(radius:2.0),Country(area:243_610),Animal(legs:4)]
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    }else{
        print(("Something that doesn't have an area"))
    }
}

//可选的协议要求（Optional Protocol Requirements）
@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count) {
            count += amount
        }else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject,CounterDataSource {
    let fixedIncrement: Int = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

@objc class ToWardsZeroSource: NSObject, CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        }else if count < 0 {
            return 1
        }else {
            return -1
        }
    }
}
counter.count = -4
counter.dataSource = ToWardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

//协议扩展（Protocol Extensions）
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
let generator2 = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And here's a random Boolean: \(generator.randomBool())")

    //提供默认实现
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

    //为协议扩展添加限制条件
extension CollectionType where Generator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map{ $0.textualDescription }
        return "[" + itemsAsText.joinWithSeparator(",") + "]"
    }
}

let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster,morganTheHamster,mauriceTheHamster]
print(hamsters.textualDescription)
        