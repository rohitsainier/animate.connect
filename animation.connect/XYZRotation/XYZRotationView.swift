//
//  XYZRotationView.swift
//  animation.connect
//
//  Created by Rohit Saini on 04/07/23.
//

import SwiftUI

struct XYZRotationView: View {
  @Binding var axis: Bool
  let model: RotateModel
  var body: some View {
    ZStack {
      Image(systemName: model.icon)
        .resizable()
        .frame(width: 50, height: 50)
        .font(.largeTitle)
        .rotationEffect(.degrees(axis ? 360 * model.rotationSpeed : 0), anchor: .center)
        .rotation3DEffect(
          .degrees(80),
          axis: (x: model.axis.0, y: model.axis.1, z: model.axis.2)
        )
        .animation(.linear(duration: 1).repeatForever(autoreverses: false))
        .onAppear() {
          axis.toggle()
        }
    }
  }
}

struct RotateModel {
  let icon: String
  let rotationSpeed: CGFloat
  let axis: (CGFloat, CGFloat, CGFloat)
}

