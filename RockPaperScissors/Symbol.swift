//
//  Symbol.swift
//  RockPaperScissors
//
//  Created by Ruben Christian Buhl on 11.07.18.
//  Copyright © 2018 Ruben Christian Buhl. All rights reserved.
//

import Foundation

enum Symbol: Character, CaseIterable {
    case rock = "✊"
    case paper = "✋"
    case scissors = "✌️"

    func getBeatenSymbols() -> [Symbol] {
        var beatenSymbols: [Symbol]

        switch self {
            case .rock:
                beatenSymbols = [.scissors]
            case .paper:
                beatenSymbols = [.rock]
            case .scissors:
                beatenSymbols = [.paper]
        }

        return beatenSymbols
    }

    func beats(_ symbol: Symbol) -> Bool {
        return getBeatenSymbols().contains(symbol)
    }
}
