//
//  main.swift
//  10_属性
//
//  Created by 赵恒 on 2017/8/24.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation

//: 存储属性
// 在其最简单的形式下，存储属性是一个作为特定类和结构体实例一部分的常量或变量。存储属性要么是变量存储属性（由 var  关键字引入）要么是常量存储属性（由 let  关键字引入）。
struct FixedLengthRange {
    var firstValue: Int
    let lenght: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, lenght: 3)
rangeOfThreeItems.firstValue = 6
print(rangeOfThreeItems.firstValue) // 6



//: 常量结构体实例的存储属性
// 如果你创建了一个结构体的实例并且赋值给一个常量，那么该实例的其他属性也是常量，不能进行修改
let rangeOfFourItems = FixedLengthRange(firstValue: 0, lenght: 4)
//rangeOfFourItems.firstValue = 7
print(rangeOfThreeItems.firstValue)
// 但是类可以



//: 延迟存储属性
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")
// 创建并使用importer
print(manager.importer.fileName)



//: 计算属性
