//
//  Test.swift
//  9_类和结构体
//
//  Created by 赵恒 on 2017/8/24.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation

struct Resolution {
    // 存储属性是绑定并存储在类或者结构体中的常量或者变量
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

