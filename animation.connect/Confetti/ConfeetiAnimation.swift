//
//  ConfeetiAnimation.swift
//  animation.connect
//
//  Created by Rohit Saini on 23/06/23.
//

import SwiftUI

/// The main view that displays a progress bar and a button.
struct ConfettiAnimation: View {
    @State private var progress: CGFloat = 0.0
    @State private var barWidth: CGFloat = UIScreen.main.bounds.width - 20
    @State private var timer: Timer?
    @State private var showConfetti: Bool = false
    
    var body: some View {
        VStack {
            // A stack that contains the progress bar, percentage text, dots, and confetti view.
            ZStack(alignment: .leading) {
                // Background rectangle of the progress bar.
                Rectangle()
                    .frame(width: barWidth, height: 10)
                    .foregroundColor(.gray)
                    .cornerRadius(20)
                
                // The progress bar indicating the progress.
                Rectangle()
                    .frame(width: progress * barWidth, height: 10)
                    .foregroundColor(.orange)
                    .cornerRadius(20)
                    .overlay(
                        // Display the progress percentage text on top of the progress bar.
                        withAnimation(.none) {
                            Text("\(Int(progress * 100))%")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .offset(x: progress, y: -20)
                        }
                    )
                
                // Display dots at specific positions on the progress bar.
                ForEach(0..<4) { index in
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.white)
                        .offset(x: (CGFloat(index + 1) * 0.20 * barWidth) - 4)
                }
                
                // Show the confetti view when progress reaches 100%.
                if showConfetti {
                    ConfettiView()
                        .frame(width: barWidth, height: 10)
                }
            }
            .padding()
            
            // Button to start the progress bar animation.
            Button(action: {
                startProgressBar()
            }) {
                Text("Start")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    
    /// Starts the progress bar animation.
    func startProgressBar() {
        progress = 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            progress += 0.01 // Increase the progress by 0.01 (you can adjust the speed here)
            
            if progress >= 1.0 {
                timer.invalidate()
                showConfetti = true
                // Show confetti for 5 seconds and then hide it.
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    showConfetti = false
                }
                print("Progress: \(Int(progress * 100))%")
            } else {
                print("Progress: \(Int(progress * 100))%")
            }
        }
    }
}

struct ConfettiAnimation_Previews: PreviewProvider {
    static var previews: some View {
      ConfettiAnimation()
    }
}
