//: Playground - noun: a place where people can play
// 运算符

import UIKit


//: 合并空值运算符
// 如果 a 有值则解包，没有则是nil
let a: String? = nil
a != nil ? a!: a
a ?? a
// 栗子🌰
let defaultColorName = "red"
var userDefaultColorName: String?
var colorNameToUse = userDefaultColorName ?? defaultColorName
userDefaultColorName = "green"
colorNameToUse = userDefaultColorName ?? defaultColorName



//: 区间运算符
// 闭区间运算符
for index in 1...5 {
    print("index: \(index)")
}
// 半开区间
let names = ["M", "o", "o", "s", "h", "r", "o", "o", "m"]
let count = names.count
for index in 0..<count {
    print("Person \(index + 1) is called \(names[index])")
}
// 单侧区间
/*
for name in names[2...] {
    print(name)
}
for name in names[...2] {
    print(name)
}
for name in names[..<2] {
    print(name)
}
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
*/








