//: Playground - noun: a place where people can play

import UIKit

//集合类型 (Collection Types)

var someInts = [Int]()
var anotherINts = Array<Int>()

someInts.append(3)
someInts = []

var threeDoubles = [Double](count:3,repeatedValue:0.0)

var shoppingList = ["eggs","milk",3]
shoppingList.append(3)

shoppingList.insert(5, atIndex: 3)

shoppingList[1..<3] = ["bananas","Apples"]
print(shoppingList)

let mapleStrup = shoppingList.removeAtIndex(0)

//集合
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []

var favoriteGenres: Set<NSObject> = ["rock",3,"hip hop"]
favoriteGenres.insert(34)

let oddDigits: Set = [1,3,5,7,9]
let evenDigits:Set = [0,2,4,6,8]
let singleDigitPremeNumbers = Set<Int>(arrayLiteral: 2,3,5,7)

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPremeNumbers)
oddDigits.exclusiveOr(singleDigitPremeNumbers).sort()

let houseAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]//["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
houseAnimals.isStrictSubsetOf(farmAnimals)
houseAnimals.isSubsetOf(farmAnimals)

//字典
var numberOfOmtegers = [Int: String]()
numberOfOmtegers[16] = "sixteen"
numberOfOmtegers = [:]

var airports = ["YYZ": "Toronto Pearson","DUB": "Dublin"]
airports["LHR"] = "London"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    print("The old value for DUB was \(oldValue)")
}

if let removedValue = airports.removeValueForKey("DUB2") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

let airportCodes = [String](airports.keys)
print(airportCodes)

