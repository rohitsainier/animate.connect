//
//  ContentView.swift
//  animation.connect
//
//  Created by Rohit Saini on 23/06/23.
//

import SwiftUI


struct ContentView: View {
  var body: some View {
    VStack {
      RingAnimationView()
      RingAnimationView2()
      RingAnimationView3()
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


