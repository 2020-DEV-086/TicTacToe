//
//  Winning.swift
//  TicTacToe
//
//  Created by 2020-DEV-086 on 20/06/2020.
//  Copyright © 2020 BNP. All rights reserved.
//

import Foundation

enum Winning: UInt, CaseIterable {

    /// 1 | 1 | 1
    /// 0 | 0 | 0
    /// 0 | 0 | 0
    case horizontalTop = 0b111000000

    /// 0 | 0 | 0
    /// 1 | 1 | 1
    /// 0 | 0 | 0
    case horizontalMiddle = 0b000111000

    /// 0 | 0 | 0
    /// 0 | 0 | 0
    /// 1 | 1 | 1
    case horizontalBottom = 0b000000111

    /// 1 | 0 | 0
    /// 1 | 0 | 0
    /// 1 | 0 | 0
    case verticalLeft = 0b100100100

    /// 0 | 1 | 0
    /// 0 | 1 | 0
    /// 0 | 1 | 0
    case verticalMiddle = 0b010010010

    /// 0 | 0 | 1
    /// 0 | 0 | 1
    /// 0 | 0 | 1
    case verticalRight = 0b001001001

    /// 1 | 0 | 0
    /// 0 | 1 | 0
    /// 0 | 0 | 1
    case diagonalTopLeft = 0b100010001

    /// 0 | 0 | 1
    /// 0 | 1 | 0
    /// 1 | 0 | 0
    case diagonalBottomLeft = 0b001010100
}
