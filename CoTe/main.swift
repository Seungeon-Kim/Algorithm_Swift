import Foundation

// 10
// 4 3 2 1 5 4 3 3 2 1
// 4 3 2 1 3 2 1 3 2 1
// 11
// 4 3 3 2 1 5 1 2 3 2 1
// dp
// 4 3 3 2 1 1 1 2 3 2 1
// 3 5 1 2 3 2 1
let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

recursive(arr: arr, result: 1)

func recursive(arr: [Int], result: Int) {
    var arr = arr
    let count = arr.count
    // var (maxIndex, maxValue) = (0, 0)

    // 가장 효율적인 높이를 찾는다 DP
    var dp = Array(repeating: 1, count: count)
    var(maxIndex, maxValue) = (0, 0)

//     for i in (1..<count).reversed() {
//         if arr[i-1] == arr[i] + 1 {
//             dp[i-1] = dp[i-1] + dp[i]
//             if dp[i-1] > maxValue {
//                 maxIndex = i-1
//             }
//         }
//     }
    
    for i in (1..<count).reversed() {
        if arr[i..<count].contains(arr[i-1] - 1){
            let index = arr[i..<count].firstIndex(of: arr[i-1] - 1)!
            dp[i-1] = dp[i-1] + dp[index]
            if dp[i-1] > maxValue {
                 maxValue = dp[i-1]
//                을 안해줬네.... 개망했다..
                maxIndex = i-1
            }
        }
    }
    
    var h = arr[maxIndex]
    for i in 0..<count {
        if arr[i] == h {
            arr[i] = 0
            h -= 1
        }
    }
    
    // 터트린 풍선 (0의값을 가지는) 제거 후 재귀
    let new_arr = arr.filter { $0 != 0 }
    if new_arr.isEmpty {
        print(result)
    } else {
        recursive(arr: new_arr, result: result + 1)
    }
}
