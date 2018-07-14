//
//  SymbolCollectionCell.swift
//  RockPaperScissors
//
//  Created by Ruben Christian Buhl on 11.07.18.
//  Copyright © 2018 Ruben Christian Buhl. All rights reserved.
//

import UIKit

class SymbolCollectionCell: UICollectionViewCell {
    @IBOutlet weak var symbolSelectionButton: UIButton!

    var delegate: SymbolSelectionDelegate!

    var symbol: Symbol! {
        didSet {
            let selectionButtonTitle = String(symbol.rawValue)

            symbolSelectionButton.setTitle(selectionButtonTitle, for: .normal)
        }
    }

    @IBAction func select() {
        delegate.select(symbol: symbol)
    }
}
