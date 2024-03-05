//
//  최소직사각형.swift
//  CodingTest
//
//  Created by 이시안 on 3/5/24.
//

import Foundation

func solution(_ sizes: [[Int]]) -> Int {
    var maxWidth = 0
    var maxHeight = 0

    // 주어진 명함들의 가로와 세로 중 가장 큰 값을 찾음
    for size in sizes {
        let width = size[0]
        let height = size[1]
        maxWidth = max(maxWidth, max(width, height))
        maxHeight = max(maxHeight, min(width, height))
    }

    // 가로로 눕힌 경우와 세로로 눕힌 경우를 고려하여 지갑의 크기를 계산
    let horizontalWalletSize = maxWidth * maxHeight

    // 모든 명함을 수납할 수 있는 가장 작은 지갑의 크기를 반환
    return horizontalWalletSize
}
