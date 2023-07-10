//
//  SilentModeView.swift
//  animation.connect
//
//  Created by Rohit Saini on 09/07/23.
//

import SwiftUI


struct SilentModeView: View {
  @State private var onOff: Bool = false
  @State private var offOn: Bool = false
  @State private var bellColor: Bool = false
  @State private var bellRotate: Bool = false
  @State private var hideSlash: Bool = false
  @State private var hideFromScreen: Bool = false
  var body: some View {
    ZStack {
      // Bell View
      Rectangle()
        .foregroundColor(.white)
        .frame(width: 220, height: 60)
        .cornerRadius(30)
      // Silent and On/Off Stack
      VStack {
        HStack(spacing: 20) {
          ZStack {
            // Bell Icon
            Image(systemName: "bell.fill")
              .font(.largeTitle)
              .foregroundColor(bellColor ? .gray : .red)
              .rotationEffect(.degrees(bellRotate ? 0 : -25), anchor: .top)
              .onAppear() {
                withAnimation(.easeInOut(duration: 0.5).delay(2.3)) {
                  bellColor.toggle()
                }
                
                withAnimation(.interpolatingSpring(stiffness: 350, damping: 3).delay(2.3)) {
                  bellRotate.toggle()
                }
              }
            
            // Slash
            Rectangle()
              .frame(width: 5, height: 40)
              .foregroundColor(.gray)
              .scaleEffect(x: 1, y: hideSlash ? 0 : 1, anchor: .topLeading)
              .rotationEffect(.degrees(-40))
              .onAppear() {
                withAnimation(.easeOut(duration: 0.8).delay(2.1)) {
                  hideSlash.toggle()
                }
              }
          }
         // On/Off View
          VStack {
            Text("Silent Mode")
              .foregroundColor(.black)
              .opacity(0.6)
              .fontWeight(.bold)
            ZStack {
              Text("Off")
                .foregroundColor(.gray)
                .fontWeight(.bold)
                .opacity(onOff ? 1 : 0)
                .onAppear() {
                  withAnimation(.easeOut(duration: 1.2).delay(2.1)) {
                    onOff.toggle()
                  }
                }
              Text("On")
                .foregroundColor(.red)
                .fontWeight(.bold)
                .opacity(offOn ? 0 : 1)
                .onAppear() {
                  withAnimation(.easeOut(duration: 1.2).delay(2.1)) {
                    offOn.toggle()
                  }
                }
            }
          }
        }
      }
    }
    .offset(y: hideFromScreen ? -UIScreen.main.bounds.height / 2.4 :
      -UIScreen.main.bounds.height / 1.8)
    .onAppear() {
      withAnimation(.easeInOut(duration: 0.5).delay(2)) {
        hideFromScreen.toggle()
      }
    }
  }
}

