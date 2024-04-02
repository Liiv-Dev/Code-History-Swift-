//
//  ContentView.swift
//  Code History (Swift)
//
//  Created by Willie Jones on 3/18/24.
//

import SwiftUI

struct GameView: View {
    
    @State private var backgroundColor: Color = GameColor.main
    let question = Question(
        questionText:"What was the first computer bug?",
        possibleAnswers: ["Ant", "Beetle", "Moth", "Fly"],
        correctAnswerIndex: 2
    )
    
    var body: some View {
        ZStack{
            backgroundColor.ignoresSafeArea()
            VStack {
                Text("1/10")
                    .font(.callout)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding()
                Text(question.questionText)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                Spacer()
                
                HStack {
                  ForEach(0..<question.possibleAnswers.count) { answerIndex in
                    Button(action: {
                        print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
                        backgroundColor = answerIndex == question.correctAnswerIndex ? .green : .red
                    }) {
                      ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                    }
                  }
                }
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    GameView()
}
