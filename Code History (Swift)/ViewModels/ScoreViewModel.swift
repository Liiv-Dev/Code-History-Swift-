//
//  ScoreViewModel.swift
//  Code History (Swift)
//
//  Created by Willie Jones on 4/4/24.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}
