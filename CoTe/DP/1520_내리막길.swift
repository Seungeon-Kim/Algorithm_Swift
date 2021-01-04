//
//  1520_내리막길.swift
//  CoTe
//
//  Created by Seungeon Kim on 2021/01/04.
//

import Foundation

class Solution_1520: Resultable {
    private var matrix: [[Int]] = []
    private var point: [Int] = []
    private let movable: [[Int]] = [[0,1], [0,-1], [1,0], [-1,0]]
    private var value = 0
    
    private func read() {
        point = readLine()!.split(separator: " ").map { Int($0)! }
        for _ in 0..<point[0] {
            let arr = readLine()!.split(separator: " ").map { Int($0)! }
            matrix.append(arr)
        }
    }
    
    private func dfs(now: [Int], visited: Set<[Int]>) {
        print("destination :: \(now)")
        var visited = visited
        
        for move in movable {
            let next = [now[0] + move[0], now[1] + move[1]]
            guard next[0] >= 0 && next[0] < point[0]
                    && next[1] >= 0 && next[1] < point[1]
                    && !visited.contains(next)
            else {
                continue
            }
            
            if matrix[next[0]][next[1]] < matrix[now[0]][now[1]] {
                if next == [point[0] - 1, point[1] - 1] {
                    value += 1
                    return
                }
                
                visited.insert(next)
                dfs(now: next, visited: visited)
            }
        }
    }
    
    func result() {
        read()
        dfs(now: [0,0], visited: [])
        print(value)
    }
}
