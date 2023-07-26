//
//  CircleGun.swift
//  animation.connect
//
//  Created by Rohit Saini on 26/07/23.
//

import SwiftUI

struct CircleGun: View {
  @State var moveOnPath: Bool = false
  @State var moveOnPath2: Bool = false
  @State var swingPath: Bool = false
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      ZStack {
        Circle()
          .trim(from: 0.2, to: 0.5)
          .stroke(lineWidth: 5)
          .frame(width: 150, height: 150, alignment: .center)
          .foregroundColor(.white)
          .rotationEffect(.degrees(swingPath ? 0 : -360))
          .onAppear() {
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: false)) {
              swingPath.toggle()
            }
          }
        ZStack {
          Circle()
            .frame(width: 25, height: 25)
            .foregroundColor(.red)
            .offset(x: -75)
            .rotationEffect(.degrees(moveOnPath ? 0 : 360))
            .onAppear() {
              withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                moveOnPath.toggle()
              }
            }
          Circle()
            .stroke(lineWidth: 5)
            .frame(width: 25, height: 25)
            .offset(x: -75)
            .foregroundColor(.yellow)
            .rotationEffect(.degrees(moveOnPath2 ? 0 : 360))
            .onAppear() {
              withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                moveOnPath2.toggle()
              }
            }
        }
      }
      .rotation3DEffect(
        .degrees(70),
        axis: (x: 10.0, y: 0.5, z: 0.0)
      )
    }
  }
}


