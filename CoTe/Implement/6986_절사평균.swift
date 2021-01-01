//
//  6986_절사평균.swift
//  CoTe
//
//  Created by Seungeon Kim on 2021/01/01.
//

//7 2
//9.3
//9.5
//9.6
//9.8
//9.1
//5.0
//9.3

//9.37
//9.39
import Foundation

class Solution_6986: Resultable {
    var n: Int = 0
    var length: Int = 0
    var arr: [Float] = []
    
    private func read() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        (n, length) = (input[0], input[1])
        
        for _ in 0..<n {
            arr.append(Float(readLine()!)!)
        }
    }
    
    func result() {
        read()
        arr.sort(by: <)
        let startIndex = (length)
        let lastIndex = arr.count - startIndex - 1
        
        let sliceArray = arr[startIndex...lastIndex]
        let base = sliceArray.reduce(0, +)
        
        let result1 = base / Float((arr.count - startIndex * 2))
        
        let front = sliceArray.first!
        let end = sliceArray.last!
        let result2 = (base + (front * Float(length)) + (end * Float(length))) / Float(n)
        
        print(String(format: "%.2f",  Float(round(100*result1)/100)))
        print(String(format: "%.2f",  Float(round(100*result2)/100)))
    }
}

