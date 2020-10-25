//
//  ContentView.swift
//  Memorize
//
//  Created by Matheus Cardoso on 23/09/20.
//

import SwiftUI
 
struct ContentView: View {
    var viewModel: EmojiMemoryGame
    var body: some View {
        HStack {
            ForEach(viewModel.cards) {card in
                CardView(card: card).onTapGesture(perform: {
                    viewModel.choose(card: card)
                })
            }
        }
            .padding()
            .foregroundColor(.orange)
            .font(.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    let defaultCornerRadius: CGFloat = 10.0
    var body: some View {
        ZStack {
            if card.facesUp {
                RoundedRectangle(cornerRadius: defaultCornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: defaultCornerRadius)
                    .stroke(lineWidth: 3.0)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: defaultCornerRadius).fill()
            }
        }
    }
}

// This make the app render in the preview on the right
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
