//: Playground - noun: a place where people can play

import Cocoa

//构造过程（Initialization）

//存储属性的初始赋值
    //构造器
struct Fahrenheit {
    var temperature: Double
    init(){
        //在此处执行构造过程
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperatura is \(f.temperature)° Fahrenheit")

    //默认属性值
//struct Fahrenheit {
//    var temperature = 32.0
//}

//自定义构造过程
    //构造参数
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double){
        temperatureInCelsius = celsius
    }
}
let boilingPountOfWater = Celsius(fromFahrenheit: 212.0)
print(boilingPountOfWater.temperatureInCelsius)
let freezingPointOfqWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfqWater.temperatureInCelsius)

    //参数的内部名称和外部名称
struct Color{
    let red,green,blue : Double
    init(red:Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//let veryGreen = Color(0.0, 1.0, 0.0)
// 报编译时错误，需要外部名称

    //不带外部名的构造器参数
let bodyTemperature = Celsius(37.0)

    //可选属性类型
class SurveyQuesstion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask(){
        print(text)
    }
}
let cheeseQuestion = SurveyQuesstion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."

    //构造过程中常量属性的修改
class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask(){
        print(text)
    }
}
let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()

//默认构造器
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

    //结构体的逐一成员构造器
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)


//值类型的构造器代理
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init(){
        
    }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size : Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY),size: size)
    }
}
let basicRect = Rect()
let originRect = Rect(origin: Point(x: 2.0,y: 2.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0,y: 4.0), size: Size(width: 3.0, height: 3.0))


//类的继承和构造过程

    //指定构造器和便利构造器

    //指定构造器和便利构造器的语法
        //类的指定构造器
        //init(parameters) {
        //    statements
        //}

        //便利构造器也采用相同样式的写法，但需要在init关键字之前放置convenience关键字，并使用空格将它们俩分开：
        //
        //convenience init(parameters) {
        //    statements
        //}

    //类的构造器代理规则
        //规则 1
        //
        //指定构造器必须调用其直接父类的的指定构造器。
        //
        //规则 2
        //
        //便利构造器必须调用同一类中定义的其它构造器。
        //
        //规则 3
        //
        //便利构造器必须最终导致一个指定构造器被调用。
        //
        //一个更方便记忆的方法是：
        //
        //指定构造器必须总是向上代理
        //便利构造器必须总是横向代理

    //两段式构造过程

    //构造器的继承和重写
class Vehicle {
    var numberOfWheels = 0
    var description : String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

    //构造器的自动继承

    //指定构造器和便利构造器实践
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
print(namedMeat.name)

let mysteryMeat = Food()
print(mysteryMeat.name)


class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem2: RecipeIngredient {
    var purchased = false
    var description : String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [ShoppingListItem2(),ShoppingListItem2(name:"Bacon"),ShoppingListItem2(name: "Eggs", quantity: 6)]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

//可失败构造器
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}


    //枚举类型的可失败构造器
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character){
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

    //带原始值的枚举类型的可失败构造器
enum TemperatureUnit2: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}
let fahrenheitUnit2 = TemperatureUnit2(rawValue: "F")
if fahrenheitUnit2 != nil {
    print("This is a defined temperature unit2, so initialization succeeded.")
}

let unknownUnit2 = TemperatureUnit2(rawValue: "X")
if unknownUnit2 == nil {
    print("This is not a defined temperature unit2, so initialization failed.")
}

    //构造失败的传递
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}
class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}
if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}
if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}

    //重写一个可失败构造器
class Document {
    var name: String?
    init() {}
    init?(name: String){
        self.name = name
        if name.isEmpty {
            return nil
        }
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "{Untitled]"
        }else{
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled}")!
    }
}

    //可失败构造器 init!

//必要构造器
    //在类的构造器前添加required修饰符表明所有该类的子类都必须实现该构造器：
    //
    //class SomeClass {
    //    required init() {
    //        // 构造器的实现代码
    //    }
    //}
    //在子类重写父类的必要构造器时，必须在子类的构造器前也添加required修饰符，表明该构造器要求也应用于继承链后面的子类。在重写父类中必要的指定构造器时，不需要添加override修饰符：
    //
    //class SomeSubclass: SomeClass {
    //    required init() {
    //        // 构造器的实现代码
    //    }
    //}


//通过闭包或函数设置属性的默认值
struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
            }
            isBlack = !isBlack
        }
        
        return temporaryBoard
    }()
    
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[row * 8 + column]
    }
}
let board = Checkerboard()
print(board.squareIsBlackAtRow(0, column: 1))
print(board.squareIsBlackAtRow(7, column: 7))


