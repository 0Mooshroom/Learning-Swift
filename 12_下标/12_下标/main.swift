//
//  main.swift
//  12_下标
//
//  Created by Mooshroom on 2017/8/25.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation

// Array可以通过[index] 来获取值
// Dictionary可以通过[key]来获取值
// 自定义值也可以通过下标subscript，在[]内写一个或多个值对该类的实例进行查询
// 定义一个TimeTable结构体来表示整数的n倍表
struct TimeTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimeTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

