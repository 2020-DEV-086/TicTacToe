//
//  ViewController.swift
//  TicTacToe
//
//  Created by 2020-DEV-086 on 20/06/2020.
//  Copyright © 2020 BNP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let game = Game()
        game.play(index: 1)
        game.play(index: 2)
        game.play(index: 1)
        game.play(index: 2)
        game.play(index: 6)
        game.play(index: 6)

    }
}

