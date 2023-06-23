//
//  ConfettiView.swift
//  animation.connect
//
//  Created by Rohit Saini on 23/06/23.
//

/*
 The ConfettiView.swift file contains the implementation for the confetti animation. Here's a breakdown of the code:
 
 ConfettiView: The main view that displays the confetti animation.
 
 @State private var confetti: An array of Confetti elements to store the confetti details.
 
 The body property displays a ZStack containing ElementView instances for each confetti element.
 
 The generateConfetti() function generates random confetti elements and adds them to the confetti array.
 
 The animateConfetti(_:) function animates the confetti elements by updating their yOffset property.
 
 Confetti: A struct representing a single confetti element.
 
 let symbol: The symbol name for the confetti element.
 var size: The size of the confetti element.
 let color: The color of the confetti element.
 var xOffset: The horizontal offset of the confetti element.
 var yOffset: The vertical offset of the confetti element.
 let duration: The duration of the confetti animation.
 ElementView: A view that displays a single confetti element.
 @Binding var confetti: A binding to a Confetti instance.
 
 The body property displays an Image with the specified symbol name and applies the confetti properties to it.
 
 Color extension: An extension to generate a random color from a predefined list of colors.
 
 ConfettiView_Previews: A preview provider for the ConfettiView.
 
 The code creates a visually appealing confetti animation by randomly generating confetti elements with different symbols, sizes, colors, and positions.
 */

import SwiftUI

/// A view that displays a confetti animation.
struct ConfettiView: View {
    @State private var confetti: [Confetti] = []
    
    var body: some View {
        ZStack {
            // Loop through the confetti array and display each confetti element.
            ForEach(confetti.indices, id: \.self) { index in
                ElementView(confetti: $confetti[index])
                    .onAppear {
                        animateConfetti(index)
                    }
            }
        }
        .onAppear {
            generateConfetti()
        }
    }
    
    /// Generates confetti elements.
    func generateConfetti() {
        for _ in 0..<150 {
            let confetti = Confetti(
                symbol: ["circle",
                         "heart",
                         "moon",
                         "leaf",
                         "cloud",
                         "star",
                         "triangle",
                         "square",
                         "flame"].randomElement() ?? "flame",
                size: CGFloat.random(in: 10...50),
                color: Color.random(),
                xOffset: CGFloat.random(in: -UIScreen.main.bounds.width...UIScreen.main.bounds.width),
                yOffset: CGFloat.random(in: -UIScreen.main.bounds.height...UIScreen.main.bounds.height),
                duration: Double.random(in: 1.0...5.0)
            )
            self.confetti.append(confetti)
        }
    }
    
    /// Animates the confetti elements.
    func animateConfetti(_ index: Int) {
        withAnimation(Animation.easeInOut(duration: confetti[index].duration)) {
            confetti[index].yOffset = UIScreen.main.bounds.height + confetti[index].size
        }
    }
}

/// Represents a single confetti element.
struct Confetti {
    let symbol: String
    var size: CGFloat
    let color: Color
    var xOffset: CGFloat
    var yOffset: CGFloat
    let duration: Double
}

/// A view that displays a confetti element.
struct ElementView: View {
    @Binding var confetti: Confetti
    
    var body: some View {
        Image(systemName: confetti.symbol)
            .resizable()
            .frame(width: confetti.size, height: confetti.size)
            .foregroundColor(confetti.color)
            .offset(x: confetti.xOffset, y: confetti.yOffset)
    }
}

extension Color {
    /// Generates a random color from a predefined list of colors.
    static func random() -> Color {
        let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink]
        return colors.randomElement() ?? .clear
    }
}

struct ConfettiView_Previews: PreviewProvider {
    static var previews: some View {
        ConfettiView()
    }
}
