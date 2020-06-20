//
//  Game.swift
//  TicTacToe
//
//  Created by 2020-DEV-086 on 20/06/2020.
//  Copyright © 2020 BNP. All rights reserved.
//

import Foundation

class Game {

    // MARK: - Public properties

    private(set) var state = GameState.playing

    private(set) var players = [Player]()

    // MARK: - Private properties

    private var turn = 0

    // MARK: - Init

    init() {
        restart()
    }

    // MARK: - Public methods

    func play(index: UInt) {

        // Check state is playing
        guard state == .playing else { return }

        // Can't play number higher then 8
        guard (1 << index) <= 0b111111111 else { return }

        // Can't play already taken index
        let taken = players.reduce(0b000000000) { $0 | $1.board.value }
        guard (taken & (1 << index)) <= 0b000000000 else { return }

        currentPlayer().board.mark(index: index)

        if win(board: currentPlayer().board) {
            state = .won
        } else if draw(boards: players.map { $0.board }) {
            state = .draw
        } else {
            toggle()
        }
    }

    func restart() {
        state = GameState.playing
        turn = 0
        players = [Player(name: "X"), Player(name: "O")]
    }

    func currentPlayer() -> Player {
        players[turn]
    }
}

// MARK: - Private methods
extension Game {
    private func toggle() {
        turn = 1 - turn
    }

    private func win(board: Board) -> Bool {
        guard board.value.nonzeroBitCount >= 3 else { return false }
        for item in Winning.allCases where item.rawValue & board.value == item.rawValue {
            return true
        }
        return false
    }

    private func draw(boards: [Board]) -> Bool {
        boards.reduce(0b000000000) { $0 | $1.value } == 0b111111111
    }
}
