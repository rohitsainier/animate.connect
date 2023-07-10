//
//  CircleLoaderView.swift
//  animation.connect
//
//  Created by Rohit Saini on 07/07/23.
//

import SwiftUI

struct CircleLoaderView: View {
  @State private var isRotataing: Bool = false
  @State private var animateStrokeStart: Bool = false
  @State private var animateStrokeEnd: Bool = false
  var model: CircleLoaderModel
  var body: some View {
    ZStack {
      Circle()
        .trim(from: animateStrokeStart ? 1/3 : 1/9, to: animateStrokeEnd ? 2/5 : 1).stroke(lineWidth: model.strokeWidth)
        .frame(width: model.width, height: model.height)
        .foregroundColor(model.color)
        .rotationEffect(.degrees(isRotataing ? 360 : 0))
        .onAppear() {
          withAnimation(.bouncy(duration: 1).repeatForever(autoreverses: false)) {
            isRotataing.toggle()
          }
          
          withAnimation(.bouncy(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
            animateStrokeStart.toggle()
          }
          
          withAnimation(.bouncy(duration: 1).delay(1).repeatForever(autoreverses: true)) {
            animateStrokeEnd.toggle()
        }
      }
    }
  }
}

struct CircleLoaderModel {
  let color: Color
  let width: CGFloat
  let height: CGFloat
  let strokeWidth: CGFloat
}

