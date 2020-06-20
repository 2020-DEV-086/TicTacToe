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
    
    func testWinningPlays() throws {
    }
    
    func testDraw() throws {
    }
}
