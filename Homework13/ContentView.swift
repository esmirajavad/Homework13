/*:
 ## CIS137 iOS/SWIFT Programming
 
 ## Homework 13
 
 Students: Esmira Babayeva,
 
 Instructor: Hellen Pacheco
 
 Date: 06 November, 2025
 
 ContentView.swift (View)
 
 Simple memory game.
  
 */


import SwiftUI



struct ContentView: View {
    @ObservedObject var viewModel: FlowerMemoryGame
    @State private var bounce = false
    @State private var colorChange = false
   
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    
    
    // Property for tracking progress of the game
    // Calculates how many pairs are matched out of the total
    private var progressFraction: Double {
            let total = max(1, viewModel.pairs)
            return Double(viewModel.matchedPairs) / Double(total)
        }
    

    
    
    var body: some View {
        // Scrolling the layout vertically
        ScrollView {
            VStack {
                Text("Memory Game")
                    .font(.largeTitle)
                    .foregroundColor(colorChange ? .red : .blue) // color change
                    .bold()
                    .padding(.top)
                    .offset(y: bounce ? -8 : 0) //moving up along y axis
                    .onTapGesture {
                        withAnimation(.spring(response: 1, dampingFraction: 0.4)) {
                                    bounce.toggle()
                                    colorChange.toggle()
                                }
                        withAnimation(.spring(response: 0.7, dampingFraction: 0.6).delay(0.3)) {
                                    bounce.toggle()
                                    colorChange.toggle()
                                }
                    }
                
                // Displays a linear progress bar showing how much of the game is completed
                ProgressView(value: progressFraction) {
                                    Text("Progress")
                                } currentValueLabel: {
                                    Text("\(Int(progressFraction * 100))%")
                                }
                                .progressViewStyle(.linear)
                                .tint(.blue)
                                .animation(.easeInOut, value: progressFraction)
                                .padding(.horizontal)

                // Grid look
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(1, contentMode: .fit)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                    viewModel.choose(card)
                                }
                            }
                    }
                }
                .padding()
            }
        }
    }
}

// Individual grid cell's/card's look
// Image is replaced with blue square on tap
struct CardView: View {
    let card: MemoryGame.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 3)
                Image(card.content)
                    .resizable()
                    .scaledToFit()
                    .padding(8)
            } else {
                RoundedRectangle(cornerRadius: 10) // single blue rectangle's measurements
                    .fill(Color.blue.opacity(1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 3)
                    )
            }
        }
        .rotation3DEffect(.degrees(card.isFaceUp ? 0 : 180), axis: (x: 1, y: 1, z: 0))
        .animation(.easeInOut(duration: 0.5), value: card.isFaceUp)
        .padding(4)
    }
}

#Preview {
    ContentView(viewModel: FlowerMemoryGame())
}

