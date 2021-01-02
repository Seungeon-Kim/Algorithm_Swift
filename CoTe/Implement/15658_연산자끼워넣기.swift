//
//  15658_연산자끼워넣기.swift
//  CoTe
//
//  Created by Seungeon Kim on 2021/01/02.
//
//2
//5 6
//1 1 1 1
import Foundation

class Solution_15658: Resultable {
    var count = 0
    var sequence: [Int] = []
    var opers: [Int] = []
    var minimum: Int = 99999999999999
    var maximum: Int = -99999999999999
    
    private func read() {
        count = Int(readLine()!)!
        sequence = readLine()!.split(separator: " ").map { Int($0)! }
        opers = readLine()!.split(separator: " ").map { Int($0)! }
    }
    
    private func oper(index: Int, val1: Int, val2: Int) -> Int {
        switch index {
        case 0:
            return val1 + val2
        case 1:
            return val1 - val2
        case 2:
            return val1 * val2
        case 3:
            return val1 / val2
        default:
            return 0
        }
    }
    
    func dfs(seq: [Int], opers: [Int]) {
        for i in 0..<4 {
            if opers[i] != 0 && seq.count >= 2 {
                let value = oper(index: i, val1: seq[0], val2: seq[1])
                
                var new_seq = [value]
                new_seq += seq[2..<seq.count]
                var new_opers = opers
                new_opers[i] -= 1
                
                dfs(seq: new_seq, opers: new_opers)
            }
        }
        if seq.count == 1 {
            minimum = min(minimum, seq[0])
            maximum = max(maximum, seq[0])
        }
    }
    
    func result() {
        read()
        dfs(seq: sequence, opers: opers)
        print(maximum)
        print(minimum)
    }
}
