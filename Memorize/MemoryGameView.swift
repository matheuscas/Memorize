//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Matheus Cardoso on 23/09/20.
//

import SwiftUI
 
struct MemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        HStack {
            ForEach(viewModel.cards) {card in
                CardView(card: card).onTapGesture(perform: {
                    viewModel.choose(card: card)
                }).aspectRatio(2/3, contentMode: .fit)
            }
        }
            .padding()
            .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: defaultCornerRadius)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: defaultCornerRadius)
                        .stroke(lineWidth: strokeLineWith)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: defaultCornerRadius)
                        .fill()
                }
            }.font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Constants
    let defaultCornerRadius: CGFloat = 10.0
    let strokeLineWith: CGFloat = 3.0
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
    
}

// This make the app render in the preview on the right
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: EmojiMemoryGame())
    }
}
