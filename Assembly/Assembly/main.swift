//
//  main.swift
//  Assembly
//
//  Created by ios on 2022/2/18.
//

import Foundation

print("Hello, World!")


/// 原始值
enum Season {
    case spring, sunmmer, autumn, winter
}

var ss = Season.spring
print(Mems.ptr(ofVal: &ss))
ss = .winter

ss = .autumn

ss = .sunmmer

print("1111")
