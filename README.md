A simple flower-themed Memory Game built with SwiftUI using MVVM architecture.

Players flip cards to find pairs while a Progress Bar tracks completion in real time.
_______________________

Main Features

MVVM Structure:

MemoryGame.swift → Model (game logic & cards)

FlowerMemoryGame.swift → ViewModel (data binding & state)

ContentView.swift → View (UI & interaction)

ProgressView: shows how many pairs are matched out of total

3D Flip Animations with smooth spring effects


Interactive Title: bounce & color change on tap

Adaptive Grid using LazyVGrid

_____________________

Progress Bar Logic

private var progressFraction: Double {
    let total = max(1, viewModel.pairs)
    return Double(viewModel.matchedPairs) / Double(total)
}


ProgressView(value: progressFraction) {
    Text("Progress")
} currentValueLabel: {
    Text("\(Int(progressFraction * 100))%")
}
.progressViewStyle(.linear)
.tint(.blue)
.animation(.easeInOut, value: progressFraction)


________________________

Built With
SwiftUI
Xcode 15 / iOS 17

CIS 137 – iOS/Swift Programming

Student: Esmira Babayeva

Instructor: Hellen Pacheco

November 2025

