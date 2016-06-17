//: Playground - noun: a place where people can play

import Cocoa

//可选链式调用（Optional Chaining）

//使用可选链式调用代替强制展开
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
//let roomCount = john.residence!.numberOfRooms
//此时john.residence为nil，运行时错误

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
}else {
    print("Unable to retrieve the number of rooms.")
}

//为可选链式调用定义模型类
class Person2 {
    var residence: Residence2?
}

class Residence2 {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        }else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        }else {
            return nil
        }
    }
}

//通过可选链式调用访问属性
let john2 = Person2()
if let roomCount = john2.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
}else {
    print("Unable to retrieve the number of rooms.")
}

func createAddress() -> Address {
    print("Function was called.")
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}
john2.residence?.address = createAddress()

//通过可选链式调用调用方法
if john2.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}


//通过可选链式调用访问下标
if let firstRoomName = john2.residence?[0].name {
    print("The first room name is \(firstRoomName).")
}else {
    print("Unable to retrieve the first room name.")
}
john2.residence?[0] = Room(name: "Bathroom")

let johnsHouse = Residence2()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john2.residence = johnsHouse

if let firstRoomName = john2.residence?[0].name {
    print("The first room name is \(firstRoomName).")
}else{
    print("Unable to retrieve the first room name.")
}

    //访问可选类型的下标
var testScores = ["Dave": [86,82,84],"Bev":[79,94,81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
print(testScores)

//连接多层可选链式调用
if let johnsStreet = john2.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john2.residence?.address = johnsAddress
if let johnsStreet = john2.residence?.address?.street {
    print("John;s street name is \(johnsStreet).")
}else {
    print("Unable to retrieve the address.")
}


//在方法的可选返回值上进行可选链式调用
if let buildingIdentifier = john2.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
}

if let beginsWithThe = john2.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    }else{
        print("John's building identifer does not begin with \"The\".")
    }
}
