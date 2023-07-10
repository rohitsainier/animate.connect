//
//  PinView.swift
//  animation.connect
//
//  Created by Rohit Saini on 06/07/23.
//

import SwiftUI

struct PinView: View {
  @State private var scale: Bool = false
  @State private var rotate: Bool = false
  @State private var jump: Bool = false
  @State private var displayRipple: Bool = false
  @State private var dismissRipple: Bool = false
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      // Pin animation
      Image(systemName: "pin.fill")
        .resizable()
        .frame(width: scale ? 70 : 40, height: 100)
        .foregroundColor(.white)
        .scaleEffect(x: 1, y: scale ? 1.1 : 0.5, anchor: .bottom)
        .rotationEffect(.degrees(rotate ? 0 : 45), anchor: .bottom)
        .offset(y: jump ? 60 : -60)
        .animation(rotate ? .interpolatingSpring(stiffness: 170, damping: 5).delay(0.3) : .easeInOut(duration: 0.25).delay(0.5).repeatCount(1, autoreverses: true))
        .onAppear() {
          scale.toggle()
          withAnimation(.easeInOut(duration: 0.5).delay(0.2).repeatCount(1, autoreverses: true)) {
            jump.toggle()
          }
          withAnimation() {
            rotate.toggle()
          }
        }
      
      // Ripple animation
      Circle()
        .strokeBorder(lineWidth: displayRipple ? 5 : 10)
        .frame(width: 300, height: 300)
        .scaleEffect(displayRipple ? 1 : 0)
        .foregroundColor(.white)
        .opacity(displayRipple ? 0 : 1)
        .offset(y: 90)
        .animation(.easeInOut(duration: 1).delay(0.5))
        .onAppear() {
          self.displayRipple.toggle()
          
          withAnimation(Animation.easeInOut(duration: 1).delay(2)) {
            self.dismissRipple.toggle()
          }
        }
    }
  }
}

