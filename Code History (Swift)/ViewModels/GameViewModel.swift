//
//  GameViewModel.swift
//  Code History (Swift)
//
//  Created by Willie Jones on 4/3/24.
//

import SwiftUI

class GameViewModel: ObservableObject {
    
    
    @Published private var game = Game()

    var currentQuestion: Question {
        game.currentQuestion
    }
            
    var questionProgressText: String {
        "\(game.currentQuestionIndex + 1) / \(game.numberOfQuestions)"
    }
    
    var guessWasMade: Bool {
        if let _ = game.guesses[currentQuestion] {
            return true
        } else {
            return false
        }
    }
    // checks correct guesses
    var correctGuesses: Int {
      game.guessCount.correct
    }
    // checks incorrect guesses
    var incorrectGuesses: Int {
      game.guessCount.incorrect
    }
    
    // check for game status
    var gameIsOver: Bool {
      game.isOver
    }
    
    func makeGuess(atIndex index: Int) {
        game.makeGuessForCurrentQuestion(atIndex: index)
    }
    
    func displayNextScreen() {
        game.updateGameStatus()
    }
    
    func color(forOptionIndex optionIndex: Int) -> Color {
        if let guessedIndex = game.guesses[currentQuestion] {
            if guessedIndex != optionIndex {
                return GameColor.main
            } else if guessedIndex == currentQuestion.correctAnswerIndex {
                return GameColor.correctGuess
            } else {
                return GameColor.incorrectGuess
            }
        } else {
            return GameColor.main
        }
    }
}
