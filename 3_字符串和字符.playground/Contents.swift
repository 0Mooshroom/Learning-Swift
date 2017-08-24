//: Playground - noun: a place where people can play
//: 字符串和字符

import UIKit
import Foundation

//: 初始化一个字符串
var emptyString = ""
type(of: emptyString)
var anotherEmptyString = String()
type(of: anotherEmptyString)
// 判断String值是否为空
if emptyString.isEmpty {
    print("emptyString is empty")
}
if anotherEmptyString.isEmpty {
    print("anotherEmptyString is empty")
}



//: 字符串可变性
var variableString = "Horse"
variableString += " and Mooshroom"

// 不可变
//let constantString = "highlander"
//constantString += " and Mooshroom"



//: 字符串是值类型
var moo_name = "Mooshroom"
// 值传递
func changeMooName(name: String) -> String {
    var changeName = name
    changeName = "Cupdog"
    return changeName
}
print("moo_name = \(changeMooName(name: moo_name))")
print("moo_name = \(moo_name)")
// 引用传递
func changeMooName1(name: inout String) {
    name = "Cupdog"
}
changeMooName1(name: &moo_name)
print("moo_name = \(moo_name)")



//: 操作字符
// 你可以通过在 for-in循环里遍历 characters属性访问 String 中的每一个独立的 Character值
for character in "Mooshroom!🐮".characters {
    print("character = \(character)")
}
// 通过Character创建独立的字符
let exclamationMark: Character = "!"
// 连接字符串和字符
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
welcome += " Mooshroom"
// append()
welcome.append("!")
welcome.append(" Ship!!!")



//: 字符统计
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐫"
print("unusualMenagerie has \(unusualMenagerie.characters.count)")



//: *** 访问和修改字符串
// 每一个String值都有相关的索引类型，String.Index，它相当于每个Character在字符串中的位置
// 字符串索引
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 2)
greeting[index]
for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}

//: 插入和删除
var moo_greeting = "hello"
// 插入
moo_greeting.insert("!", at: moo_greeting.endIndex) // 字符
moo_greeting.insert(contentsOf: " Mooshromm", at: moo_greeting.index(before: moo_greeting.endIndex)) // 字符串
// 删除
moo_greeting.remove(at: moo_greeting.index(before: moo_greeting.endIndex))
let range = moo_greeting.startIndex..<moo_greeting.index(after: moo_greeting.startIndex)
moo_greeting.removeSubrange(range)



//: 字符串比较
// 字符串和字符相等性
let moo_name2 = "Mooshroom"
let same_moo_name2 = "Mooshroom"
if moo_name2 == same_moo_name2 {
    print("moo_name is equalTo same_moo_name")
}
if moo_name2.hasPrefix("Moo") {
    print("hasPrefix yes")
}




