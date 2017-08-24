//: Playground - noun: a place where people can play

import UIKit
import Foundation


//: 数组
// 创建一个空数组
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
someInts.append(3)
someInts = []
// 使用默认值来创建数组
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherDoubles = Array(repeating: 2.5, count: 4)
var sixDoubles = threeDoubles + anotherDoubles
// 使用数组字面量来创建数组
//var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList = ["Eggs", "Milk"]



//: 访问和修改数组
shoppingList.count
if shoppingList.isEmpty {
    print("shopingList is none")
} else {
    print("shopingList isn't none")
}
shoppingList.append("Apple")
shoppingList.append("Bnana")
shoppingList += ["Mooshroom"]
shoppingList += ["二代", "大同"]
var firstItem = shoppingList[0]
firstItem = "E"
shoppingList[0] = firstItem
shoppingList
shoppingList[0...1] = ["B", "C", "D"]
shoppingList
shoppingList.insert("E", at: 0)
let removeItem0 = shoppingList.remove(at: 0)
let removeLastItem = shoppingList.removeLast()


//: 遍历一个数组
for item in shoppingList {
    print(item)
}
// enumerated()
for (index, value) in shoppingList.enumerated() {
    print("item \(index): \(value)")
}



//: 合集
// 创建一个空合集
var letters = Set<Character>()
letters.insert("A")
letters
letters = []
// 使用数组字面量创建合集
//let favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
if favoriteGenres.isEmpty {
    
} else {
    print("favorieGenres is not null")
}
favoriteGenres.insert("Mooshroom")
favoriteGenres.remove("Rock")
favoriteGenres
if favoriteGenres.contains("Mooshroom") {
    print("favoriteGenres contains Mooshroom")
}
// 遍历
for item in favoriteGenres {
    print(item)
}
for item in favoriteGenres.sorted() {
    print(item)
}
internal struct Mooshroom: Hashable {
    var name: String?
    var age: UInt?
    var hashValue: Int {
        get {
            var hashString = ""
            if let tName = self.name {
                hashString = tName + ";"
            }
            return hashString.hashValue
        }
    }
}
func == (lhs: Mooshroom, rhs: Mooshroom) -> Bool {
    return lhs.name == rhs.name && lhs.age == rhs.age
}

let moo1 = Mooshroom(name: "moo1", age: 24)
let moo2 = Mooshroom(name: "moo1", age: 24)

let arr1: Set = [moo1]
let arr2: Set = [moo2]

if arr1 == arr2 {
    print("arr1 == arr2")
} else {
    print("arr1 != arr2")
}




//: 字典
// 创建一个空字典
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "SixTeen"
namesOfIntegers = [:]
// 使用字面量创建数组
var airports = ["M": "Moo", "O": "Shroom"]
airports["M"] = "Mooz"
airports["P"] = "Ship"
if let oldValue = airports.updateValue("Dublin", forKey: "O") {
    print(oldValue)
}
airports["P"] = nil
airports
if let removedValue = airports.removeValue(forKey: "O") {
    print("removedValue = \(removedValue)")
}
airports

// 遍历
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// keys
for code in airports.keys {
    print("\(code)")
}

let codes = [String](airports.keys)
let values = [String](airports.values)




