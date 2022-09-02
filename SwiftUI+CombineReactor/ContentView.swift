//
//  ContentView.swift
//  SwiftUI+CombineReactor
//
//  Created by wotjd on 2022/09/03.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var reactor = ContentViewReactor()
  
  var body: some View {
    Stepper("\(self.reactor.currentState.value)") {
      self.reactor.action.send(.up)
    } onDecrement: {
      self.reactor.action.send(.down)
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
