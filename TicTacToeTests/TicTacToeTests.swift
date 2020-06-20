//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by 2020-DEV-086 on 20/06/2020.
//  Copyright © 2020 BNP. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {

    func testGameSetup() throws {
        let game = Game()
        XCTAssertNotNil(game.players[0], "Validate player X not nil")
        XCTAssertNotNil(game.players[1], "Validate player O not nil")
        XCTAssertEqual(game.players[0].name, "X", "Validate player X name")
        XCTAssertEqual(game.players[1].name, "O", "Validate player O name")
    }

    func testXGoesFirst() throws {
        let game = Game()
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X goes first")
        game.restart()
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X goes first after restart")
        game.play(index: 0)
        XCTAssertEqual(game.currentPlayer().name, "O", "Player O after play")
        game.restart()
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X goes first after restart")
    }

    func testAlternatePlacing() throws {
        let game = Game()
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X's turn")
        game.play(index: 0)
        XCTAssertEqual(game.currentPlayer().name, "O", "Player O's turn")
        game.play(index: 1)
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X's turn")
        game.play(index: 2)
        XCTAssertEqual(game.currentPlayer().name, "O", "Player O's turn")
        game.play(index: 3)
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X's turn")
    }

    func testPlayerBoard() throws {
        let game = Game()
        XCTAssertEqual(game.players[0].board.value, 0b000000000, "Empty board player X")
        XCTAssertEqual(game.players[1].board.value, 0b000000000, "Empty board player O")
        game.play(index: 0)
        XCTAssertEqual(game.players[0].board.value, 0b000000001, "Index 0")

        game.play(index: 2)
        XCTAssertEqual(game.players[1].board.value, 0b000000100, "Index 2")

        game.play(index: 4)
        XCTAssertEqual(game.players[0].board.value, 0b000010001, "Index 4")

        game.restart()

        XCTAssertEqual(game.players[0].board.value, 0b000000000, "Empty board player X")
        XCTAssertEqual(game.players[1].board.value, 0b000000000, "Empty board player O")
    }

    func testHorizontalWinningPlays() throws {

        /// Test horizontal top
        /// X | X | X
        /// .  | .  | 0
        /// .  | .  | 0
        let game = Game()
        game.play(index: 8)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 0)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 7)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 3)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 6)
        XCTAssertEqual(game.state, .won, "State won")
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X won")

        /// Test horizontal middle
        /// .  | .  | 0
        /// X | X | X
        /// .  | .  | 0
        game.restart()
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 5)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 0)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 4)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 6)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 3)
        XCTAssertEqual(game.state, .won, "State won")
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X won")

        /// Test horizontal bottom
        /// 0 | .  | 0
        /// .  | .  | .
        /// X | X | X
        game.restart()
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 0)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 8)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 1)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 6)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 2)
        XCTAssertEqual(game.state, .won, "State won")
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X won")
    }

    func testVerticalWinningPlays() throws {

        /// Test vertical left
        /// X | .  | 0
        /// X | .  | .
        /// X | .  | 0
        let game = Game()
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 8)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 6)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 5)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 0)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 2)
        XCTAssertEqual(game.state, .won, "State won")
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X won")

        /// Test vertical middle
        /// .  | X | 0
        /// .  | X | .
        /// .  | X | 0
        game.restart()
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 7)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 6)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 4)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 0)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 1)
        XCTAssertEqual(game.state, .won, "State won")
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X won")

        /// Test vertical right
        /// .  | .  | X
        /// 0 | .  | X
        /// 0 | .  | X
        game.restart()
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 0)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 2)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 3)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 5)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 6)
        XCTAssertEqual(game.state, .won, "State won")
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X won")
    }

    func testDiagonalWinningPlays() throws {

        /// Test diagonal top left
        /// X | .  | 0
        /// .  | X | 0
        /// .  | .  | X
        let game = Game()
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 0)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 6)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 4)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 3)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 8)
        XCTAssertEqual(game.state, .won, "State won")
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X won")

        /// Test diagonal bottom left
        /// .  | .  | X
        /// .  | X | 0
        /// X | 0 | .
        game.restart()
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 2)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 1)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 4)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 3)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 6)
        XCTAssertEqual(game.state, .won, "State won")
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X won")
    }

    func testDraw() throws {

        /// Test draw
        /// 0 | X | 0
        /// X | X | 0
        /// X | 0 | X
        let game = Game()
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 0)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 1)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 2)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 3)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 4)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 8)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 7)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 6)
        XCTAssertEqual(game.state, .playing, "State playing")
        game.play(index: 5)
        XCTAssertEqual(game.state, .draw, "State draw")
    }

    func testInvalidPlacing() throws {
        let game = Game()
        game.play(index: 0)
        XCTAssertEqual(game.currentPlayer().name, "O", "Player O's turn")
        game.play(index: 9)
        XCTAssertEqual(game.currentPlayer().name, "O", "Player O's turn, can't play invalid number")
        game.play(index: 0)
        XCTAssertEqual(game.currentPlayer().name, "O", "Player O's turn, can't play invalid number")
        game.play(index: 1)
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X's turn")
        game.play(index: 1)
        XCTAssertEqual(game.currentPlayer().name, "X", "Player X's turn, can't play invalid number")
    }
}
