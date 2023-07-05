//
//  ContentView.swift
//  animation.connect
//
//  Created by Rohit Saini on 23/06/23.
//

import SwiftUI


struct ContentView: View {
  @State var start: Bool = false
  var body: some View {
    ZStack {
      Button(action: {
        start.toggle()
      }, label: {
        Text("Start")
          .fontWeight(.heavy)
      })
      if start {
        SyncSpinner()
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
