//
//  ContentView.swift
//  BrainyRockPaperScissors
//
//  Created by Dennis Dang on 10/17/19.
//  Copyright © 2019 Dennis Dang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let possibleMoves = ["Rock", "Paper", "Scissors"]
    @State private var moveIdx = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    
    var body: some View {
        let shouldWinText = shouldWin ? "win" : "lose"
        
        return VStack(spacing: 12) {
            Text("\(self.score)")
            Text("\(possibleMoves[moveIdx])")
            Text("Please \(shouldWinText)")
            HStack {
                ForEach(possibleMoves, id: \.self) { move in
                    Button(move, action: {
                        self.determineWin(for: move)
                    })
                }
            }
        }.font(.largeTitle)
    }
    
    func determineWin(for move: String) {
        let compMove = possibleMoves[moveIdx]
        if self.shouldWin {
            if compMove == "Rock" && move == "Paper" {
                self.score += 1
                self.reset()
                return
            } else if compMove == "Scissors" && move == "Rock" {
                self.score += 1
                self.reset()
                return
            } else if compMove == "Paper" && move == "Scissors" {
                self.score += 1
                self.reset()
                return
            }
        } else {
            if compMove == "Rock" && move != "Paper" {
                self.score += 1
                self.reset()
                return
            } else if compMove == "Scissors" && move != "Rock" {
                self.score += 1
                self.reset()
                return
            } else if compMove == "Paper" && move != "Scissors" {
                self.score += 1
                self.reset()
                return
            }
        }
        
        self.reset()
    }
    
    func reset() {
        self.shouldWin = Bool.random()
        self.moveIdx = Int.random(in: 0..<3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
