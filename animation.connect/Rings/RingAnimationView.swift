//
//  RingAnimationView.swift
//  animation.connect
//
//  Created by Rohit Saini on 03/07/23.
//

import SwiftUI

struct RingAnimationView: View {
  @State var strokeGrows: Bool = false
  @State var strokeGrows2: Bool = false
  @State var strokeGrows3: Bool = false
  @State var strokeGrows4: Bool = false
  
  var body: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(.all)
      RingView(grows: $strokeGrows,
               ring: Ring(width: 100,
                          height: 100,
                          color: Color.random(),
                          rotationAngle: 30,
                          rotation3DAngle: 60,
                          springResponse: 1,
                          springDumping: 6,
                          springBlendDuration: 2),
               shape: Circle())
      
      RingView(grows: $strokeGrows2,
               ring: Ring(width: 100,
                          height: 100,
                          color: Color.random(),
                          rotationAngle: 90,
                          rotation3DAngle: 180,
                          springResponse: 1,
                          springDumping: 2,
                          springBlendDuration: 4),
               shape: Circle())
      
      RingView(grows: $strokeGrows3,
               ring: Ring(width: 100,
                          height: 100,
                          color: Color.random(),
                          rotationAngle: 60,
                          rotation3DAngle: 270,
                          springResponse: 1,
                          springDumping: 2,
                          springBlendDuration: 6),
               shape: Circle())
      
      RingView(grows: $strokeGrows4,
               ring: Ring(width: 200,
                          height: 200,
                          color: .white,
                          rotationAngle: 90,
                          rotation3DAngle: 0,
                          springResponse: 5,
                          springDumping: 1,
                          springBlendDuration: 1,
                          lineWidth: 5),
               shape: Circle())
    }
  }
}

struct RingAnimationView2: View {
  @State var strokeGrows: Bool = false
  @State var strokeGrows2: Bool = false
  @State var strokeGrows3: Bool = false
  @State var strokeGrows4: Bool = false
  
  var body: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(.all)
      RingView(grows: $strokeGrows,
               ring: Ring(width: 100,
                          height: 100,
                          color: Color.random(),
                          rotationAngle: 30,
                          rotation3DAngle: 60,
                          springResponse: 1,
                          springDumping: 6,
                          springBlendDuration: 2, dashSpace: 40),
               shape: Rectangle())
      
      RingView(grows: $strokeGrows2,
               ring: Ring(width: 100,
                          height: 100,
                          color: Color.random(),
                          rotationAngle: 90,
                          rotation3DAngle: 180,
                          springResponse: 1,
                          springDumping: 2,
                          springBlendDuration: 4),
               shape: Rectangle())
      
      RingView(grows: $strokeGrows3,
               ring: Ring(width: 100,
                          height: 100,
                          color: Color.random(),
                          rotationAngle: 60,
                          rotation3DAngle: 270,
                          springResponse: 1,
                          springDumping: 2,
                          springBlendDuration: 6),
               shape: Rectangle())
      
      RingView(grows: $strokeGrows4,
               ring: Ring(width: 200,
                          height: 200,
                          color: .white,
                          rotationAngle: 90,
                          rotation3DAngle: 0,
                          springResponse: 5,
                          springDumping: 1,
                          springBlendDuration: 1,
                          lineWidth: 5,
                          dashWidth: 5),
               shape: Rectangle())
    }
  }
}

struct RingAnimationView3: View {
  @State var strokeGrows: Bool = false
  @State var strokeGrows2: Bool = false
  @State var strokeGrows3: Bool = false
  @State var strokeGrows4: Bool = false
  
  var body: some View {
    ZStack {
      Color.black.edgesIgnoringSafeArea(.all)
      RingView(grows: $strokeGrows,
               ring: Ring(width: 100,
                          height: 100,
                          color: Color.random(),
                          rotationAngle: 30,
                          rotation3DAngle: 60,
                          springResponse: 1,
                          springDumping: 6,
                          springBlendDuration: 2,
                          dashSpace: 40),
               shape: Circle())
      
      RingView(grows: $strokeGrows2,
               ring: Ring(width: 100,
                          height: 100,
                          color: Color.random(),
                          rotationAngle: 90,
                          rotation3DAngle: 180,
                          springResponse: 1,
                          springDumping: 2,
                          springBlendDuration: 4,
                          dashSpace: 40),
               shape: Circle())
      
      RingView(grows: $strokeGrows3,
               ring: Ring(width: 100,
                          height: 100,
                          color: Color.random(),
                          rotationAngle: 60,
                          rotation3DAngle: 270,
                          springResponse: 1,
                          springDumping: 2,
                          springBlendDuration: 6,
                          dashSpace: 40),
               shape: Circle())
      
      RingView(grows: $strokeGrows4,
               ring: Ring(width: 200,
                          height: 200,
                          color: .white,
                          rotationAngle: 90,
                          rotation3DAngle: 0,
                          springResponse: 5,
                          springDumping: 1,
                          springBlendDuration: 1,
                          lineWidth: 5),
               shape: Circle())
    }
  }
}



struct RingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        RingAnimationView()
    }
}

struct RingView<ShapeType: Shape>: View {
  @Binding var grows: Bool
  var ring: Ring
  var shape: ShapeType // The shape to be used (Circle or Rectangle)
  var body: some View {
    shape
      .trim(from: grows ? 0 : 1, to: 1)
      .stroke(style: StrokeStyle(lineWidth: ring.lineWidth,
                                 dash: [ring.dashWidth,ring.dashSpace],
                                 dashPhase: 1.0))
      .frame(width: ring.width,
             height: ring.height)
      .foregroundColor(ring.color)
      .rotationEffect(.degrees(ring.rotationAngle))
      .rotation3DEffect(.degrees(ring.rotation3DAngle), axis: (x: 1, y: 1, z: 1))
      .animation(.spring(response: ring.springResponse,
                         dampingFraction: ring.springDumping,
                         blendDuration: ring.springBlendDuration).delay(1).repeatForever(autoreverses: ring.autoreverses)
      )
      .onAppear {
        grows.toggle()
      }
  }
}

struct Ring {
  var width: CGFloat
  var height: CGFloat
  var color: Color
  var rotationAngle: CGFloat
  var rotation3DAngle: CGFloat
  var springResponse: CGFloat
  var springDumping: CGFloat
  var springBlendDuration: CGFloat
  var autoreverses: Bool = true
  var lineWidth: CGFloat = 15
  var dashWidth: CGFloat = 1
  var dashSpace: CGFloat = 4
}
