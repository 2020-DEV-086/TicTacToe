//
//  GameCollectionViewCell.swift
//  TicTacToe
//
//  Created by 2020-DEV-086 on 20/06/2020.
//  Copyright © 2020 BNP. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak var label: UILabel!

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
}
