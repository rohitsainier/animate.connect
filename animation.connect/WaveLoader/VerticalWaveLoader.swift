//
//  VerticalWaveLoader.swift
//  animation.connect
//
//  Created by Rohit Saini on 20/07/23.
//

import SwiftUI

struct VerticalWaveLoader: View {
  @State private var one: Bool = false
  @State private var two: Bool = false
  @State private var three: Bool = false
  @State private var four: Bool = false
  @State private var five: Bool = false
  @State private var six: Bool = false
  @State private var seven: Bool = false
  @State private var eight: Bool = false
  @State private var nine: Bool = false
  @State private var ten: Bool = false
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      ZStack {
        // 1
        Circle()
          .stroke(lineWidth: 5)
          .foregroundColor(.white)
          .frame(width: 20, height: 20)
          
          .rotation3DEffect(
            .degrees(75),
            axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .offset(y: one ? -150 : 150)
          .onAppear() {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
              one.toggle()
            }
          }
        
        // 2
        Circle()
          .stroke(lineWidth: 5)
          .foregroundColor(Color.random())
          .frame(width: 50, height: 50)
          
          .rotation3DEffect(
            .degrees(75),
            axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .offset(y: two ? -150 : 150)
          .onAppear() {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.1)) {
              two.toggle()
            }
          }
        
        // 3
        Circle()
          .stroke(lineWidth: 5)
          .foregroundColor(.white)
          .frame(width: 80, height: 80)
          
          .rotation3DEffect(
            .degrees(75),
            axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .offset(y: three ? -150 : 150)
          .onAppear() {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.2)) {
              three.toggle()
            }
          }
        
        // 4
        Circle()
          .stroke(lineWidth: 5)
          .foregroundColor(Color.random())
          .frame(width: 110, height: 110)
          
          .rotation3DEffect(
            .degrees(75),
            axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .offset(y: four ? -150 : 150)
          .onAppear() {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.3)) {
              four.toggle()
            }
          }
        
        // 5
        Circle()
          .stroke(lineWidth: 5)
          .foregroundColor(.white)
          .frame(width: 140, height: 140)
          
          .rotation3DEffect(
            .degrees(75),
            axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .offset(y: five ? -150 : 150)
          .onAppear() {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.4)) {
              five.toggle()
            }
          }
        
        // 6
        Circle()
          .stroke(lineWidth: 5)
          .foregroundColor(Color.random())
          .frame(width: 170, height: 170)
          
          .rotation3DEffect(
            .degrees(75),
            axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .offset(y: six ? -150 : 150)
          .onAppear() {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.5)) {
              six.toggle()
            }
          }
        
        // 7
        Circle()
          .stroke(lineWidth: 5)
          .foregroundColor(.white)
          .frame(width: 200, height: 200)
          
          .rotation3DEffect(
            .degrees(75),
            axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .offset(y: seven ? -150 : 150)
          .onAppear() {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.6)) {
              seven.toggle()
            }
          }
        
        // 8
        Circle()
          .stroke(lineWidth: 5)
          .foregroundColor(Color.random())
          .frame(width: 230, height: 230)
          
          .rotation3DEffect(
            .degrees(75),
            axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .offset(y: eight ? -150 : 150)
          .onAppear() {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.7)) {
              eight.toggle()
            }
          }
        
        // 9
        Circle()
          .stroke(lineWidth: 5)
          .foregroundColor(.white)
          .frame(width: 260, height: 260)
          
          .rotation3DEffect(
            .degrees(75),
            axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .offset(y: nine ? -150 : 150)
          .onAppear() {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.8)) {
              nine.toggle()
            }
          }
        
        // 10
        Circle()
          .stroke(lineWidth: 5)
          .foregroundColor(.white)
          .frame(width: 300, height: 300)
          
          .rotation3DEffect(
            .degrees(75),
            axis: (x: 1.0, y: 0.0, z: 0.0)
          )
          .offset(y: ten ? -150 : 150)
          .onAppear() {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true).delay(0.9)) {
              ten.toggle()
            }
          }
      }
      .padding()
    }
    
  }
}

