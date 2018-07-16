//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Ruben Christian Buhl on 11.07.18.
//  Copyright © 2018 Ruben Christian Buhl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SymbolSelectionDelegate {
    let winText = "You win!"
    let lossText = "You lose!"
    let drawText = "Draw!"

    @IBOutlet var symbolCollectionDataSource: SymbolCollectionDataSource!

    @IBOutlet weak var opponentSymbolLabel: UILabel!
    @IBOutlet weak var userSymbolLabel: UILabel!

    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        symbolCollectionDataSource.symbolSelectionDelegate = self
    }

    func select(symbol: Symbol) {
        let opponentSymbol = Symbol.allCases.randomElement()!

        presentSelections(userSymbol: symbol, opponentSymbol: opponentSymbol)
        evaluate(userSymbol: symbol, opponentSymbol: opponentSymbol)
    }

    func evaluate(userSymbol: Symbol, opponentSymbol: Symbol) {
        if let beatVerb = userSymbol.beats(opponentSymbol) {
            buildAndPresentResultText(winText, symbolA: userSymbol, beatVerb: beatVerb, symbolB: opponentSymbol)
        } else if let beatVerb = opponentSymbol.beats(userSymbol) {
            buildAndPresentResultText(lossText, symbolA: opponentSymbol, beatVerb: beatVerb, symbolB: userSymbol)
        } else {
            presentResultText(drawText)
        }
    }

    func buildAndPresentResultText(_ resultText: String, symbolA: Symbol, beatVerb: String, symbolB: Symbol) {
        let resultText = buildResultText(resultText, symbolA: symbolA, beatVerb: beatVerb, symbolB: symbolB)

        presentResultText(resultText)
    }

    func buildResultText(_ resultText: String, symbolA: Symbol, beatVerb: String, symbolB: Symbol) -> String {
        let beatText = buildBeatText(symbolA: symbolA, beatVerb: beatVerb, symbolB: symbolB)

        return buildResultText(resultText, beatText: beatText)
    }

    func buildResultText(_ resultText: String, beatText: String) -> String {
        return """
        \(resultText)
        \(beatText)
        """
    }

    func buildBeatText(symbolA: Symbol, beatVerb: String, symbolB: Symbol) -> String {
        let beatText = "\(symbolA) \(beatVerb) \(symbolB)."

        return capitalizeFirstLetter(text: beatText)
    }

    func capitalizeFirstLetter(text: String) -> String {
        return text.prefix(1).capitalized + text.dropFirst()
    }

    func presentSelections(userSymbol: Symbol, opponentSymbol: Symbol) {
        opponentSymbolLabel.text = "\(opponentSymbol.rawValue)"
        userSymbolLabel.text = "\(userSymbol.rawValue)"
    }

    func presentResultText(_ text: String) {
        resultLabel.text = text
    }
}
