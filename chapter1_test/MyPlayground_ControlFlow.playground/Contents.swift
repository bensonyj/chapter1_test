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

        