//: Playground - noun: a place where people can play

import UIKit

//控制流（Control Flow）2016.6.2

let numberOfLegs = ["spider":8,"ant":6,"cat":4]
for (animalName,legCount) in numberOfLegs{
    print("\(animalName)s have \(legCount) legs")
}


let finalSquare = 25
var board = [Int](count:finalSquare+1,repeatedValue:0)
board[03] = +08
board[06] = +11
board[09] = +09
board[10] = +02
board[14] = -10
board[19] = -11
board[22] = -02

var square = 0
var diceRoll = 0
while square < finalSquare{
    //掷骰子
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    
    //根据点数移动
    square += diceRoll
    if square < board.count{
        //如果玩家还在棋盘上，顺着梯子爬上去或者顺着蛇滑下去
        square += board[square]
    }
    
    let string = "骰子点数:" + String(diceRoll)
    
    print(string)
}

square = 0
diceRoll = 0

repeat{
    //顺着梯子爬上去或者顺着蛇滑下去
    square += board[square]
    
    //掷骰子
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    //更加点数移动
    square += diceRoll
}while square < finalSquare

print("Game over!")

//switch
let someCharacter: Character = "e"
switch someCharacter{
    case "a","e","i","o","u":
        print("\(someCharacter) is a vowel")
    case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
        print("\(someCharacter) is a consonant")
    default:
        print("\(someCharacter) is not a vowel or a consonant")
}

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount{
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "serveral"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount)\(naturalCount).")

//控制转移语句（Control Transfer Statements）

//贯穿（Fallthrough）
let integerToDescription = 5
var description = "The number \(integerToDescription) is"
switch integerToDescription{
case 2,3,5,7,11,13,17,19:
    description += " a prime number, and als0"
    fallthrough
case 1,4,8:
    description += "ts"
default:
    description += " an integer"
}
print(description)

//带标签的语句
square = 0
diceRoll = 0


gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    
    switch square + diceRoll {
    case finalSquare:
        //到达最后一个方块，游戏结束
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        //超出最后一个方块，再掷一次骰子
        continue gameLoop
    default:
        //本次移动有效
        square += diceRoll
        square += board[square]
    }
}

//提前退出
func greet(person:[String:String]){
    guard let name = person["name"] else{
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else{
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(["name":"John"])
greet(["name":"Jane","location":"Cupertino"])

//检测 API 可用性
//if #available(`platform name` `version`, `...`, *) {
//    `statements to execute if the APIs are available`
//} else {
//    `fallback statements to execute if the APIs are unavailable`
//}


