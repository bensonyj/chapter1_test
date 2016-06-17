//: Playground - noun: a place where people can play

import Cocoa

//自动引用计数（Automatic Reference Counting）

//自动引用计数的工作机制


//自动引用计数实践
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialzed")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

//类实例之间的循环强引用
class Person2 {
    let name : String
    init(name: String) {
        self.name = name
    }
    
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialzed")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    
    var tenant: Person2?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person2?
var unit4A: Apartment?
john = Person2(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil


//解决实例之间的循环强引用
    //对于生命周期中会变为nil的实例使用弱引用。相反地，对于初始化赋值后再也不会被赋值为nil的实例，使用无主引用。

    //弱引用
        //在之前例子中Apartment类中tenant变量前加weak修饰符

    //无主引用
        //和弱引用类似，无主引用不会牢牢保持住引用的实例。和弱引用不同的是，无主引用是永远有值的。因此，无主引用总是被定义为非可选类型（non-optional type）。你可以在声明属性或者变量时，在前面加上关键字unowned表示这是一个无主引用。
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit{
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var YJ: Customer?
YJ = Customer(name: "YJ Appleseed")
YJ!.card = CreditCard(number: 1234_5678_9012_3456, customer: YJ!)

YJ = nil

    //无主引用以及隐式解析可选属性
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City.init(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

//闭包引起的循环强引用
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML:Void -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }else{
            return "<\(self.name) />"
        }
    }
    
    init(name: String,text: String? = nil){
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello,world")
print(paragraph!.asHTML())

paragraph = nil

//解决闭包引起的循环强引用
        //在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用。捕获列表定义了闭包体内捕获一个或者多个引用类型的规则。跟解决两个类实例间的循环强引用一样，声明每个捕获的引用为弱引用或无主引用，而不是强引用。应当根据代码关系来决定使用弱引用还是无主引用。

    //定义捕获列表
//lazy var someClosure: (Int, String) -> String = {
//    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
//    // 这里是闭包的函数体
//}

//lazy var someClosure: Void -> String = {
//    [unowned self, weak delegate = self.delegate!] in
//    // 这里是闭包的函数体
//}

    //弱引用和无主引用
class HTMLElement2 {
    let name: String
    let text: String?
    
    lazy var asHTML: Void -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }else{
            return "<\(self.name) />"
        }
    }
    
    init(name: String,text: String? = nil){
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph2: HTMLElement2? = HTMLElement2(name: "p", text: "hello, world")
print(paragraph2!.asHTML())
paragraph2 = nil

