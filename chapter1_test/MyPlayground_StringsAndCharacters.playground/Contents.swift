//: Playground - noun: a place where people can play

import UIKit

//字符串和字符（Strings and Characters）2016.6.2

var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty{
    print("Nothing to see here")
}

let constantString = "Highlabder"
var variableString = constantString
variableString += " and carriage"

for character in "Dog!🐶".characters{
    print(character)
}

let emptyCharacter = "\t\0\\ \n\\ \r\\"
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

//字符串索引 (String Indices)
let greeting = "Guten Tag!"
greeting.startIndex
greeting[greeting.startIndex]
//greeting[greeting.endIndex.predecessor()]
//let index = greeting.startIndex.advancedBy(Int("7")!)
//greeting[index]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.characters.indices{
    print("\(greeting[index])",terminator:"")
}

var welcome = "hello"
//welcome.insert("!", atIndex: welcome.endIndex)
welcome.insert("!", at: welcome.endIndex)

//welcome.insertContentsOf(" there".characters, at: welcome.endIndex.predecessor())
welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))

//welcome.removeAtIndex(welcome.endIndex.predecessor())
//welcome.removeRange(welcome.endIndex.advancedBy(-6)..<welcome.endIndex)
welcome.remove(at: welcome.index(before: welcome.endIndex))
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet{
    if scene.hasPrefix("Act 1"){
        act1SceneCount += 1
    }
}

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet{
    if scene.hasSuffix("Capulet's mansion"){
        mansionCount += 1
    }else if scene.hasSuffix("Friar Lawrence's cell"){
        cellCount += 1
    }
}


