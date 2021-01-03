//
//  2178_미로탐색.swift
//  CoTe
//
//  Created by Seungeon Kim on 2021/01/03.
//

//4 6
//101111
//101010
//101011
//111011

import Foundation

class Solution_2178: Resultable {
    private var destination: [Int] = []
    private var matrix: [[Int]] = []
    private let movable = [[0,1], [0,-1], [1,0], [-1,0]]
    
    private func read() {
        destination = readLine()!.split(separator: " ").map { Int($0)! }
        for _ in 0..<destination[0] {
            let row = Array(readLine()!.map { Int(String($0))! })
            matrix.append(row)
        }
    }
    
    private func bfs(positions: [[Int]], visited: [[Int]], result: Int) -> Int {
        guard !positions.contains([destination[0]-1, destination[1]-1]) && !positions.isEmpty else {
            return result
        }
        
        var new_positions: [[Int]] = []
        var visited = visited
        
        for position in positions {
            for move in movable {
                let moved = [position[0] + move[0], position[1] + move[1]]
                if moved[0] >= 0 && moved[1] >= 0 && moved[0] < destination[0] && moved[1] < destination[1]
                    && matrix[moved[0]][moved[1]] == 1 && !visited.contains(moved) {
                    new_positions.append(moved)
                    visited.append(moved)
                }
            }
        }
        
        return bfs(positions: new_positions, visited: visited, result: result + 1)
    }
    
    func result() {
        read()
        let result = bfs(positions: [[0,0]], visited: [[0,0]], result: 1)
        print(result)
    }
}
