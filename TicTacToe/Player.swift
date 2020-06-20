//
//  Player.swift
//  TicTacToe
//
//  Created by 2020-DEV-086 on 20/06/2020.
//  Copyright © 2020 BNP. All rights reserved.
//

import Foundation

class Player {

    // MARK: - Public properties

    let name: String

    var board = Board()

    // MARK: - Init

    init(name: String) {
        self.name = name
    }
}
