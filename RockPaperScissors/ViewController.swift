//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Ruben Christian Buhl on 11.07.18.
//  Copyright © 2018 Ruben Christian Buhl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SymbolSelectionDelegate {
    let resultConfirmationButtonTitle = "OK"

    let winTitle = "You win!"
    let lossTitle = "You lose!"
    let drawTitle = "Draw!"

    let userSelectionMessage = "User selected:"
    let appSelectionMessage = "App selected:"

    let beatVerb = "beats"

    @IBOutlet var symbolCollectionDataSource: SymbolCollectionDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        symbolCollectionDataSource.symbolSelectionDelegate = self
    }

    func select(symbol: Symbol) {
        evaluate(userSymbol: symbol, appSymbol: Symbol.allCases.randomElement()!)
    }

    func evaluate(userSymbol: Symbol, appSymbol: Symbol) {
        let selectionMessage = getSelectionMessage(userSymbol: userSymbol, appSymbol: appSymbol)

        if userSymbol.beats(appSymbol) {
            presentResult(title: winTitle, message: selectionMessage + getBeatMessage(userSymbol, beats: appSymbol))
        } else if appSymbol.beats(userSymbol) {
            presentResult(title: lossTitle, message: selectionMessage + getBeatMessage(appSymbol, beats: userSymbol))
        } else {
            presentResult(title: drawTitle, message: selectionMessage)
        }
    }

    func getSelectionMessage(userSymbol: Symbol, appSymbol: Symbol) -> String {
        return "\(userSelectionMessage) \(userSymbol.rawValue)\n\(appSelectionMessage) \(appSymbol.rawValue)\n"
    }

    func getBeatMessage(_ symbol: Symbol, beats beatenSymbol: Symbol) -> String {
        return "\(symbol.rawValue) \(beatVerb) \(beatenSymbol.rawValue)"
    }

    func presentResult(title: String, message: String) {
        let resultController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let confirmationAction = UIAlertAction(title: resultConfirmationButtonTitle, style: .default, handler: nil)

        resultController.addAction(confirmationAction)

        present(resultController, animated: false)
    }
}
