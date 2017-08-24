//: Playground - noun: a place where people can play

import UIKit

let printLine = "-------------------"

//: 控制流for-in循环
let names = ["Mooshroom", "Hellolad", "Cupdog"]
for name in names {
    print("name: \(name)")
}
print(printLine)
// 键值对for-in
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (name, count) in numberOfLegs {
    print("\(name) has \(count) legs.")
}
print(printLine)
// 遍历数字
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
print(printLine)
// 忽略index
let base = 3, power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// stride(from:to:by) 闭区间
let minutes = 60, minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print("\(tickMark) ", terminator: "")
}
// stride(from:through:to) 半开区间
let hours = 12, hourInterval = 3
for tickMark in stride(from: 0, through: hours, by: hourInterval) {
    print("\(tickMark) ", terminator: "")
}
print("")
print(printLine)



//: 没有隐式贯穿
let anotherCharactor: Character = "a"
switch anotherCharactor {
case "a":
    print("letter a")
case "A":
    print("letter A")
default:
    print("Not letter A")
}
print(printLine)



//: 值绑定 where语句
/*
 let anotherPoint = (2, -2)
 switch anotherPoint {
 case (let x, -2) where x == -2:
 print("x = \(x)")
 case (2, let y) where 2 != y:
 print("y = \(y)")
 case let (x, y):
 print("x = \(x), y = \(y)")
 default:
 print("都不匹配")
 }
 */



//: 提前退出 guard
let person = ["age": "9", "name": "shroom"]
func greeting() {
    guard let name = person["name"] else {
        print("name isn't here")
        return
    }
    print("name is \(name)")
}
greeting()
print(printLine)



//: 检查API的可用性
if #available(iOS 11, *) {
    print("ios 11")
} else if #available(iOS 10, *) {
    print("ios 10")
} else if #available(iOS 9, *) {
    print("ios 9")
}


