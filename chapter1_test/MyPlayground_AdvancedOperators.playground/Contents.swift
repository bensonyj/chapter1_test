//: Playground - noun: a place where people can play

import Cocoa

var str = "高级运算符（Advanced Operators）"

//位运算符

    //按位取反运算符:~
let initialBits: UInt8 = 0b00001111
let invertedBits: UInt8 = ~initialBits

    //按位与运算符:&
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

    //按位与运算符:|
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedBits = someBits | moreBits

    //按位异或运算符:^
let firstBits = 0b00010100
let otherBits = 0b00000101
let outputBits = firstBits ^ otherBits

    //按位左移、右移运算符:按位左移运算符（<<）和按位右移运算符（>>）
let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0x00FF00) >> 8
let blueComponent = pink & 0x0000FF


//溢出运算符
    //溢出加法 &+
    //溢出减法 &-
    //溢出乘法 &*
var potentialOverflow = Int16.max
//potentialOverflow += 1
// 这里会报错

    //数值溢出
var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1

//优先级和结合性

//运算符函数
struct Vector2D {
    var x = 0.0, y = 0.0
}

func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
print(combinedVector.x)
let vectorTest = 10 + 11

    //前缀和后缀运算符:要实现前缀或者后缀运算符，需要在声明运算符函数的时候在 func 关键字之前指定 prefix 或者 postfix 修饰符
prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
print(negative.x)
let alsoPositive = -negative
print(alsoPositive.x)

    //复合赋值运算符
func += (inout left: Vector2D, right: Vector2D) {
    left = left + right
}
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 2.0, y: 4.0)
original += vectorToAdd
print(original.x)

    //等价运算符
func == (left: Vector2D, right: Vector2D) -> Bool{
    return (left.x == right.x) && (left.y == right.y)
}
func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

//自定义运算符:新的运算符要使用 operator 关键字在全局作用域内进行定义，同时还要指定 prefix、infix 或者 postfix 修饰符
prefix operator +++ {}
prefix func +++ (inout vector: Vector2D) -> Vector2D {
    vector += vector
    return vector
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubled = +++toBeDoubled
print(toBeDoubled.x)
print(afterDoubled.x)

    //自定义中缀运算符的优先级和结合性
infix operator +- { associativity left precedence 140}
func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
print("left:\(plusMinusVector.x), right: \(plusMinusVector.y)")
        