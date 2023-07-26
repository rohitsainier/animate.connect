//
//  SunView.swift
//  animation.connect
//
//  Created by Rohit Saini on 19/07/23.
//

import SwiftUI

struct SunView: View {
  @State private var animate: Bool = false
  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      
      //Title
      Text("Sunrise - Sunset")
        .font(.largeTitle)
        .fontWeight(.heavy)
        .foregroundColor(.white)
        .offset(y: -300)
      
      // Start Time
      Text("5:43 AM")
        .fontWeight(.bold)
        .foregroundColor(.white)
        .offset(x: -150, y: 45)
      
      // End Time
      Text("08:43 PM")
        .fontWeight(.bold)
        .foregroundColor(.white)
        .offset(x: 150, y: 45)
      
      // Dash Line
      Circle()
        .trim(from: 1/2, to: 1)
        .stroke(style: StrokeStyle(lineWidth: 3, dash: [10,10]))
        .foregroundColor(.yellow)
        .frame(width: 300, height: 300)
      
      // Start Dot
      Circle()
        .frame(width: 10, height: 10)
        .foregroundColor(.yellow)
        .offset(x: -150, y: 10)
      
      // End Dot
      Circle()
        .frame(width: 10, height: 10)
        .foregroundColor(.yellow)
        .offset(x: 150, y: 10)
      
      // Sun Image
      Image(systemName: "sun.max.fill")
        .font(.title)
        .foregroundColor(.yellow)
        .offset(x: -150)
        .rotationEffect(.degrees(animate ? 180 : 0))
        .onAppear() {
          withAnimation(.easeInOut(duration: 5).delay(2).repeatForever(autoreverses: true)) {
            animate.toggle()
          }
        }
      
      // Status
      Text(animate ? "Good Evening" : "Good Morning")
        .font(.headline)
        .fontWeight(.bold)
        .foregroundColor(.white)
    }
  }
}

