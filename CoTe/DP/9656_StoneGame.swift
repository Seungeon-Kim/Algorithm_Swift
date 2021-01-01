//
//  9656_StoneGame.swift
//  CoTe
//
//  Created by Seungeon Kim on 2020/12/31.
//

import Foundation

//탁자 위에 돌 N개가 있다.
//턴을 번갈아가면서 돌을 가져가며, 돌은 1개 또는 3개 가져갈 수 있다.
//마지막 돌을 가져가는 사람이 게임을 지게 된다.
//마지막 돌을 가져가는 사람이 게임을 지게 된다.
//상근이가 게임을 이기면 SK를, 창영이가 게임을 이기면 CY을 출력한다.
// 4
// SK
// 1 1 1 1 1 1 1 1 1 1 1
class StoneGame {
    private let n: Int
    
    init(number: Int) {
        self.n = number
    }
    
    func solution() -> String {
        if n % 2 == 0 {
            return result.winner_sk
        }
        
        return result.winner_cy
    }
}

private extension StoneGame {
    enum result {
        static let winner_sk = "SK"
        static let winner_cy = "CY"
    }
}
