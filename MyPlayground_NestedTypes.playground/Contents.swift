//: Playground - noun: a place where people can play

import UIKit

var str = "嵌套类型（Nested Types）"
//要在一个类型中嵌套另一个类型，将嵌套类型的定义写在其外部类型的{}内，而且可以根据需要定义多级嵌套。


//嵌套类型实践
struct BlackjackCard {
    //嵌套的Suit枚举
    enum Suit: Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    //嵌套的Rank枚举
    enum Rank: Int {
        case Two = 2,Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    //自身的属性和方法
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
print("theAceOfSpades:\(theAceOfSpades.description)")

//引用嵌套类型
    //在外部引用嵌套类型时，在嵌套类型的类型名前加上其外部类型的类型名作为前缀：
let heartsSymbol = BlackjackCard.Suit.Hearts.rawValue


