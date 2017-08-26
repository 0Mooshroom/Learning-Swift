//
//  main.swift
//  17_类型转换
//
//  Created by 赵恒 on 2017/8/26.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation


//: 为类型转换定义类层次
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
print(type(of: library))    // Array<MediaItem> 字面量推断为MediaItem类型



//: 类型检查 is
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}
print("Media library contains \(movieCount) movies and \(songCount) songs.")



//: 向下类型转换
// as? || as!
for item in library {
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir:\(movie.director)")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by:\(song.artist)")
    }
}



//: Any 和 AnyObject的类型转换
// Swift为不确定的类型提供了两种类型的类型别名：
// - AnyObject: 可以表示任何类类型的实例
// - Any: 可以表示任何类型，包括函数类型

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Three Body", director: "CiXin .L"))
things.append({ (name:String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as an Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("Some other double value that I don't want a print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called '\(movie.name)', dir. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Mooshroom"))
    default:
        print("something else")
    }
}
// 输出
/*
 zero as an Int
 zero as an Double
 an integer value of 42
 a positive double value of 3.14159
 a string value of "hello"
 an (x, y) point at 3.0, 5.0
 a movie called 'Three Body', dir. CiXin .L
 Hello, Mooshroom
 */

