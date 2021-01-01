//
//  11722_가장긴감소하는부분수열.swift
//  CoTe
//
//  Created by Seungeon Kim on 2020/12/31.
//

//수열 A가 주어졌을 때, 가장 긴 감소하는 부분 수열을 구하는 프로그램
//예를 들어, 수열 A = {10, 30, 10, 20, 20, 10} 인 경우
//가장 긴 감소하는 부분 수열은 A = {30, 20, 10}이고,
//길이는 3
//input
//7
//10 5 30 10 20 20 10
// 1 1 1 1 1 1 1
// 2  1  3  2  2  2  1
//output
//3
import Foundation

class Solution11722: Resultable {
    let arr: [Int]
    
    init(arr: [Int]) {
        self.arr = arr
    }
    
    func result() {
        var result = 0
        var dp = Array(repeating: 1, count: arr.count)
        let count = arr.count
        
        for i in (0..<count).reversed() {
            var temp = 0
            for j in i+1..<count {
                if arr[i] > arr[j] {
                    temp = max(temp, dp[j])
                }
            }
            dp[i] = temp + 1
            result = max(result, dp[i])
        }
        print(result)
    }
}
