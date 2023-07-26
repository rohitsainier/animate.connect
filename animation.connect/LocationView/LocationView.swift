//
//  LocationView.swift
//  animation.connect
//
//  Created by Rohit Saini on 12/07/23.
//

import SwiftUI

struct LocationView: View {
  @State private var blueCircle: Bool = false
  @State private var bigBlueCircle: Bool = false
  var body: some View {
    ZStack {
      Color.white.ignoresSafeArea()
      // Big Blue Circle
      Circle()
        .frame(width: 200, height: 200)
        .foregroundColor(.blue)
        .opacity(bigBlueCircle ? 0 : 0.5)
        .scaleEffect(bigBlueCircle ? 1.4 : 0)
        .onAppear() {
          withAnimation(.easeOut(duration: 2).delay(2).repeatForever(autoreverses: false)) {
            bigBlueCircle.toggle()
          }
        }
      
      //White Border circle
      Circle()
        .frame(width: 18)
        .foregroundColor(.white)
      
      //Small Blue circle
      Circle()
        .frame(width: 14)
        .foregroundColor(.blue)
        .scaleEffect(blueCircle ? 0.9 : 1.1)
        .onAppear() {
          withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
            blueCircle.toggle()
          }
        }
      
    }
  }
}

