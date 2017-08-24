//
//  main.swift
//  9_类和结构体
//
//  Created by Mooshroom on 2017/8/24.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation

// 创建类和结构体的实例
var someResolution = Resolution()
var someVideoMode = VideoMode()


// 结构体类型的成员初始化器
let vga = Resolution(width: 640, height: 480)


//: ***结构体和枚举是值类型
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
cinema.height = 1080
print(cinema.width, cinema.height)
print(hd.width, hd.height)



//: 类是引用类型
let tenEnighty = VideoMode()
tenEnighty.resolution = hd
tenEnighty.interlaced = true
tenEnighty.name = "1080i"
tenEnighty.frameRate = 25.0
print(tenEnighty.frameRate)

let alsoTenEnighty = tenEnighty
alsoTenEnighty.frameRate = 30.0
print(tenEnighty.frameRate)



//: 特征运算符
if tenEnighty === alsoTenEnighty {
    print("yes")
}

