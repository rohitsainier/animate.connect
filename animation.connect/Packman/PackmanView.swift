//
//  PackmanView.swift
//  animation.connect
//
//  Created by Rohit Saini on 02/07/23.
//

import SwiftUI

struct PackmanView: View {
  @State var inMouth: Bool = false
  @State var openLower: Bool = false
  @State var openUpper: Bool = false
  @State var randomColor: Color = Color.random()
  var body: some View {
    ZStack {
      // white dot act as food for packman
      Circle()
        .frame(width: 10)
        .foregroundColor(randomColor)
        .offset(x: inMouth ? 20 : 95, y: 5)
        .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: false))
        .onAppear() {
          inMouth.toggle()
        }
      
      // upper jaw
      Circle()
        .trim(from: 1/3, to: openLower ? 0.9999 : 0.9)
        .frame(width: 200, height: 200)
        .rotationEffect(.degrees(0))
        .foregroundColor(randomColor)
        .animation(.easeInOut(duration: 0.3).repeatForever(autoreverses: true))
        .onAppear() {
          openUpper.toggle()
        }
      
      // lower jaw
      Circle()
        .trim(from: 1/3, to: openUpper ? 0.9999 : 0.9)
        .frame(width: 200, height: 200)
        .rotationEffect(.degrees(180))
        .foregroundColor(randomColor)
        .rotation3DEffect(
          .degrees(180),
          axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .animation(.easeInOut(duration: 0.3).repeatForever(autoreverses: true))
        .onAppear() {
          openLower.toggle()
        }
      
      //Eye
      Circle()
        .frame(width: 10)
        .offset(x:20, y:-55)
      Circle()
        .frame(width: 3)
        .foregroundColor(.white)
        .offset(x:20, y:-55)
      Capsule()
        .trim(from: 1/2, to: 1)
        .stroke(lineWidth: 3)
        .frame(width: 20, height: 15)
        .foregroundColor(.black)
        .offset(x:20, y: -55)
      Capsule()
        .trim(from: 1/2, to: 1)
        .stroke(lineWidth: 2)
        .frame(width: 30, height: 15)
        .rotationEffect(.degrees(180))
        .foregroundColor(.black)
        .offset(x:20, y: -55)
    }
  }
}

//#Preview {
//    PackmanView()
//}
