//
//  GameViewController.swift
//  TicTacToe
//
//  Created by 2020-DEV-086 on 20/06/2020.
//  Copyright © 2020 BNP. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    // MARK: - Private properties

    private let game = GameViewModel()

    // MARK: - Outlets

    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "GameCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "GameCollectionViewCell")
        game.delegate = self
    }
}

// MARK: - Private methods

extension GameViewController {
    private func convertIndexPathToGameIndex(_ index: Int) -> UInt {
        UInt(GameViewModel.fields - index - 1)
    }
}

// MARK: - GameDelegate

extension GameViewController: GameDelegate {
    func end(state: GameState, player: Player?) {

        var message = ""
        if state == .draw {
            message = "Game ended in a draw"
        } else if state == .won, let player = player {
            message = "🎉 \(player.name) won 🎉"
        }

        let alert = UIAlertController(title: "Game ended",
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.collectionView.reloadData()
            self.game.restart()
        }))
        self.present(alert, animated: true)
    }
}

// MARK: - UICollectionViewDelegate

extension GameViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GameCollectionViewCell else { return }
        let index = convertIndexPathToGameIndex(indexPath.row)
        game.play(index: index) { [weak self] in
            cell.label.text = self?.game.currentPlayer().name
        }
    }
}

// MARK: - UICollectionViewDataSource

extension GameViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        GameViewModel.fields
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // swiftlint:disable force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell",
                                                      for: indexPath) as! GameCollectionViewCell
        cell.label.text = ""
        return cell
    }
}

// MARK: - UICollectionViewDataSource

extension GameViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size.width / 3
        return CGSize(width: size, height: size)
    }
}
