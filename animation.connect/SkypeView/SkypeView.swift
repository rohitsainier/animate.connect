//
//  SkypeView.swift
//  animation.connect
//
//  Created by Rohit Saini on 10/07/23.
//

import SwiftUI

struct SkypeView: View {
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      CircleRingView1()
      CircleRingView2()
      CircleRingView3()
      SkypeLogo()
    }
  }
}

struct SkypeLogo: View {
  @State var animate: Bool = false
  var body: some View {
    ZStack {
      Circle()
        .frame(width: 180, height: 180)
      Circle()
        .frame(width: 100, height: 100)
        .offset(y: 70)
      Circle()
        .frame(width: 100, height: 100)
        .offset(y: -70)
      Text("S")
        .font(.system(size: 150))
        .fontWeight(.heavy)
        .foregroundColor(.white)
        .rotationEffect(.degrees(45))
    }
    .foregroundColor(Color(red: 0/255, green: 175/255, blue: 240/255))
    .rotationEffect(.degrees(-45))
    .scaleEffect(animate ? 1 : 1.4)
      .onAppear() {
        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
          animate.toggle()
        }
      }
  }
}

struct CircleRingView1: View {
  @State private var circle1: Bool = false
  var body: some View {
    Circle()
      .frame(width: 212+80, height: 212+80)
      .scaleEffect(circle1 ? 1.2 : 0.5,
                   anchor: .center)
      .foregroundColor(Color(red: 142/255, green: 212/255, blue: 251/255))
      .opacity(0.5)
      .onAppear() {
        withAnimation(.easeOut(duration: 1).repeatForever(autoreverses: true).delay(0.3)) {
          circle1.toggle()
        }
      }
  }
}

struct CircleRingView2: View {
  @State private var circle2: Bool = false
  var body: some View {
    Circle()
      .frame(width: 212+40, height: 212+40)
      .scaleEffect(circle2 ? 1.2 : 0.5,
                   anchor: .center)
      .foregroundColor(Color(red: 66/255, green: 147/255, blue: 247/255))
      .opacity(0.5)
      .onAppear() {
        withAnimation(.easeOut(duration: 1).repeatForever(autoreverses: true).delay(0.2)) {
          circle2.toggle()
        }
      }
  }
}

struct CircleRingView3: View {
  @State private var circle3: Bool = false
  var body: some View {
    Circle()
      .frame(width: 212, height: 212)
      .scaleEffect(circle3 ? 1.2 : 0.5,
                   anchor: .center)
      .foregroundColor(Color(red: 33/255, green: 81/255, blue: 141/255))
      .opacity(0.5)
      .onAppear() {
        withAnimation(.easeOut(duration: 1).repeatForever(autoreverses: true).delay(0.2)) {
          circle3.toggle()
        }
      }
  }
}
