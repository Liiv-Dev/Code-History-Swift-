//
//  Game.swift
//  Code History (Swift)
//
//  Created by Willie Jones on 4/1/24.
//

import Foundation

struct Game {
    // The index of the current question in the game
    private(set) var currentQuestionIndex = 0
    
    // A dictionary to store guesses for each question
    private(set) var guesses = [Question: Int]()
    
    // Indicates whether the game is over
    private(set) var isOver = false
    
    // An array of shuffled questions for the game
    private let questions = Question.allQuestions.shuffled()

    // Computed property to get the count of correct and incorrect guesses
    var guessCount: (correct: Int, incorrect: Int) {
        var count: (correct: Int, incorrect: Int) = (0, 0)
        for (question, guessedIndex) in guesses {
            if question.correctAnswerIndex == guessedIndex {
                count.correct += 1
            } else {
                count.incorrect += 1
            }
        }
        return count
    }
        
    // Computed property to get the total number of questions in the game
    var numberOfQuestions: Int {
        questions.count
    }
    
    // Computed property to get the current question
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }

    // Method to make a guess for the current question
    mutating func makeGuessForCurrentQuestion(atIndex index: Int) {
        guesses[currentQuestion] = index
    }

    // Method to update the game status after each guess
    mutating func updateGameStatus() {
        // If there are more questions remaining, move to the next question
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            // If all questions are answered, mark the game as over
            isOver = true
        }
    }
}
