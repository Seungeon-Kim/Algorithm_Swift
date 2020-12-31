//
//  main.swift
//  CoTe
//
//  Created by Seungeon Kim on 2020/12/31.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int($0)! }
let solution = Solution11722(arr: arr)

solution.result()
