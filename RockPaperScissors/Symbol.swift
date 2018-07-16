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
    case lizard = "🦎"
    case spock = "🖖"

    private var beatVerbs: [Symbol: String] {
        switch self {
            case .rock:
                return [
                    .scissors: "crushes",
                    .lizard: "crushes"
                ]
            case .paper:
                return [
                    .rock: "covers",
                    .spock: "disproves"
                ]
            case .scissors:
                return [
                    .paper: "cuts",
                    .lizard: "decapitates"
                ]
            case .lizard:
                return [
                    .spock: "poisons",
                    .paper: "eats"
                ]
            case .spock:
                return [
                    .scissors: "smashes",
                    .rock: "vaporizes"
                ]
        }
    }

    func beats(_ symbol: Symbol) -> String? {
        return beatVerbs[symbol]
    }
}
