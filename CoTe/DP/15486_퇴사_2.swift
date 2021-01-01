//
//  15486_퇴사_2.swift
//  CoTe
//
//  Created by Seungeon Kim on 2020/12/31.
//

//첫째 줄에 N (1 ≤ N ≤ 1,500,000)이 주어진다.
//둘째 줄부터 N개의 줄에 Ti와 Pi가 공백으로 구분되어서 주어지며,
//1일부터 N일까지 순서대로 주어진다. (1 ≤ Ti ≤ 50, 1 ≤ Pi ≤ 1,000)

//7
//3 10
//5 20
//1 10
//1 20
//2 15
//4 40
//2 200
//
//45
import Foundation

class Solution_15486: Resultable {
    private var matrix: [[Int]] = []
    private var dp: [Int] = []
    private lazy var count = { matrix.count }()
    
    private func read() {
        let n = Int(readLine()!)!
        for _ in 0..<n {
            let arr = readLine()!.split(separator: " ").map { Int($0)! }
            matrix.append(arr)
        }
        
        dp = Array(repeating: 0, count: count)
    }
    
    func result() {
        read()
        for i in (0..<count).reversed() {
            if i + matrix[i][0] <= count {
                let value = dp[i..<count].max()!
                if let weight = dp.indices ~= (i + matrix[i][0]) ? dp[i + matrix[i][0]] : nil {
                    dp[i] = max(matrix[i][1] + weight, value)
                } else {
                    dp[i] = max(matrix[i][1], value)
                }
            }
        }
        
        print(dp[0])
    }
}
