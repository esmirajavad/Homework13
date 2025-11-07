/*:
 ## CIS137 iOS/SWIFT Programming
 
 ## Homework 13
 
 Students: Esmira Babayeva,
 
 Instructor: Hellen Pacheco
 
 Date: 06 November, 2025
 */
//  Homework13App.swift



import SwiftUI

@main
struct Homework13App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: FlowerMemoryGame())
        }
    }
}
