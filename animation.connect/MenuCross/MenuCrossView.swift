//
//  MenuCrossView.swift
//  animation.connect
//
//  Created by Rohit Saini on 19/07/23.
//

import SwiftUI

struct MenuCrossView: View {
  @State private var topLine: Bool = false
  @State private var middleLine: Bool = false
  @State private var bottomLine: Bool = false
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      // Menu Lines
      VStack(spacing: 20) {
        Rectangle()
          .frame(width: 120, height: 20)
          .cornerRadius(5)
          .rotationEffect(.degrees(topLine ? 45 : 0), anchor: .leading)
        Rectangle()
          .frame(width: 120, height: 20)
          .cornerRadius(5)
          .scaleEffect(middleLine ? 0 : 1)
          .opacity(middleLine ? 0 : 1)
        Rectangle()
          .frame(width: 120, height: 20)
          .cornerRadius(5)
          .rotationEffect(.degrees(bottomLine ? -45 : 0), anchor: .leading)
      }
      .foregroundColor(.white)
      .onAppear() {
        withAnimation(.interpolatingSpring(stiffness: 300, damping: 20).repeatForever(autoreverses: true)) {
          topLine.toggle()
          middleLine.toggle()
          bottomLine.toggle()
          
        }
      }
      
    }
  }
}
