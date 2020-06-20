//
//  Board.swift
//  TicTacToe
//
//  Created by 2020-DEV-086 on 20/06/2020.
//  Copyright © 2020 BNP. All rights reserved.
//

import Foundation

struct Board {

    // MARK: - Public properties

    private(set) var value: UInt = 0b000000000

    // MARK: - Public methods

    mutating func mark(index: UInt) {
        value = value | (1 << index)
    }
}
