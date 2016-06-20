//: Playground - noun: a place where people can play

import Cocoa

var str = "访问控制（Access Control）"
//模块和源文件
    //模块指的是独立的代码单元，框架或应用程序会作为一个独立的模块来构建和发布。在 Swift 中，一个模块可以使用 import 关键字导入另外一个模块。
//访问级别
    //public：可以访问同一模块源文件中的任何实体，在模块外也可以通过导入该模块来访问源文件里的所有实体。通常情况下，框架中的某个接口可以被任何人使用时，你可以将其设置为 public 级别。
    //internal：可以访问同一模块源文件中的任何实体，但是不能从模块外访问该模块源文件中的实体。通常情况下，某个接口只在应用程序或框架内部使用时，你可以将其设置为 internal 级别。
    //private：限制实体只能在所在的源文件内部使用。使用 private 级别可以隐藏某些功能的实现细节。
    //public 为最高（限制最少）访问级别，private 为最低（限制最多）访问级别。

    //访问级别基本原则
    //默认访问级别
    //单 target 应用程序的访问级别
    //框架的访问级别
    //单元测试 target 的访问级别

//访问控制语法
    //public class SomePublicClass {}
    //internal class SomeInternalClass {}
    //private class SomePrivateClass {}
    //
    //public var somePublicVariable = 0
    //internal let someInternalConstant = 0
    //private func somePrivateFunction() {}
    //除非专门指定，否则实体默认的访问级别为 internal

//自定义类型
//public class SomePublicClass {          // 显式的 public 类
//    public var somePublicProperty = 0   // 显式的 public 类成员
//    var someInternalProperty = 0        // 隐式的 internal 类成员
//    private func somePrivateMethod() {} // 显式的 private 类成员
//}
//
//class SomeInternalClass {               // 隐式的 internal 类
//    var someInternalProperty = 0        // 隐式的 internal 类成员
//    private func somePrivateMethod() {} // 显式的 private 类成员
//}
//
//private class SomePrivateClass {        // 显式的 private 类
//    var somePrivateProperty = 0         // 隐式的 private 类成员
//    func somePrivateMethod() {}         // 隐式的 private 类成员
//}
    //元组类型
    //函数类型
    //枚举类型
//枚举成员的访问级别和该枚举类型相同，你不能为枚举成员单独指定不同的访问级别。
    //嵌套类型

//子类

//常量、变量、属性、下标
    //Getter和Setter
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

//构造器
    //默认构造器
    //结构体默认的成员逐一构造器

//协议
    //协议继承
    //协议一致性

//扩展
    //通过扩展添加协议一致性

//泛型

//类型别名