//
//  SymbolCollectionDataSource.swift
//  RockPaperScissors
//
//  Created by Ruben Christian Buhl on 11.07.18.
//  Copyright © 2018 Ruben Christian Buhl. All rights reserved.
//

import UIKit

class SymbolCollectionDataSource: NSObject, UICollectionViewDataSource {
    let symbolCellIdentifier = "Symbol Cell"

    var symbolSelectionDelegate: SymbolSelectionDelegate!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Symbol.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: symbolCellIdentifier, for: indexPath)

        if let symbolCell = collectionCell as? SymbolCollectionCell {
            symbolCell.delegate = symbolSelectionDelegate

            symbolCell.symbol = Symbol.allCases[indexPath.item]
        }

        return collectionCell
    }
}
