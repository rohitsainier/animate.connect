//
//  VoiceRecordingView.swift
//  animation.connect
//
//  Created by Rohit Saini on 01/07/23.
//

import SwiftUI

struct VoiceRecordingView: View {
  @State var animateBigCircle: Bool = false
  @State var animateSmallCircle: Bool = false
  var body: some View {
    VStack {
      Text("Voice Recoding...")
        .fontWeight(.heavy)
      ZStack {
        // Big Circle
        Circle()
          .stroke()
          .scaleEffect(animateBigCircle ? 1 : 0.3)
          .opacity(animateBigCircle ? 0 : 1)
          .animation(.easeInOut(duration: 2).repeatForever(autoreverses: false))
          .onAppear() {
            animateBigCircle.toggle()
          }
        
        // Small Circle
        Circle()
          .foregroundColor(Color(red: 0.905, green: 0.91, blue: 0.91))
          .frame(width: 150, height: 150)
          .scaleEffect(animateSmallCircle ? 0.9 : 1.1)
          .animation(.easeInOut(duration: 0.4).repeatForever(autoreverses: false))
          .onAppear() {
            animateSmallCircle.toggle()
          }
        
        // red circle
        Circle()
          .foregroundColor(.red)
          .frame(width: 72, height: 72)
        Capsule()
          .frame(width: 12, height: 24)
          .foregroundColor(.white)
          .offset(y: -5)
        Capsule()
          .trim(from: 1/2, to: 1)
          .stroke(lineWidth: 3)
          .frame(width: 22, height: 24)
          .rotationEffect(.degrees(180))
          .foregroundColor(.white)
          .offset(y: -2)
        Rectangle()
          .frame(width: 4, height: 6)
          .foregroundColor(.white)
          .offset(y: 14)
      }
    }
  }
}



#Preview {
    VoiceRecordingView()
}
