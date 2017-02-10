//: Playground - noun: a place where people can play

import UIKit

//集合类型 (Collection Types)

var someInts = [Int]()
var anotherINts = Array<Int>()

someInts.append(3)
someInts = []

//var threeDoubles = [Double](count:3,repeatedValue:0.0)
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingList = ["eggs","milk",3] as [Any]
shoppingList.append(3)

//shoppingList.insert(5, atIndex: 3)
shoppingList.insert(5, at: 3)

shoppingList[1..<3] = ["bananas","Apples"]
print(shoppingList)

//let mapleStrup = shoppingList.removeAtIndex(0)
let mapleSyrup = shoppingList.remove(at: 0)
let bananas = shoppingList.removeLast()

for (index,value) in shoppingList.enumerated(){
    print("Item \(String(index + 1)):\(value)")
}

//集合
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []

var favoriteGenres: Set<String> = ["rock","Classical","hip hop"]
favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("rock") {
    print("\(removedGenre)? I'm over it.")
}else{
    print("I never much cared fot that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
}else{
    print("It's too funky in here.")
}


let oddDigits: Set = [1,3,5,7,9]
let evenDigits:Set = [0,2,4,6,8]
let singleDigitPremeNumbers = Set<Int>(arrayLiteral: 2,3,5,7)

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPremeNumbers)
oddDigits.symmetricDifference(singleDigitPremeNumbers).sorted()

let houseAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]//["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
houseAnimals.isSubset(of: farmAnimals)
houseAnimals.isStrictSubset(of: farmAnimals)

//字典
var numberOfOmtegers = [Int: String]()
numberOfOmtegers[16] = "sixteen"
numberOfOmtegers = [:]

var airports = ["YYZ": "Toronto Pearson","DUB": "Dublin"]
airports["LHR"] = "London"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
    print("The old value for DUB was \(oldValue)")
}

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

let airportCodes = [String](airports.keys)
print(airportCodes)

