//
//  ContentViewReactor.swift
//  SwiftUI+CombineReactor
//
//  Created by wotjd on 2022/09/03.
//

import Foundation
import Combine
import CombineReactor

final class ContentViewReactor: Reactor {
  enum Action {
    case up, down
  }
  enum Mutation {
    case countUp, countDown
  }
  struct State {
    var value = 0
  }
  
  let initialState = State()
  
  func mutate(action: Action) -> any Publisher<Mutation, Never> {
    switch action {
    case .up:
      return Just(.countUp).delay(for: .seconds(2), scheduler: DispatchQueue.main)
    case .down:
      return Just(.countDown)
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    
    switch mutation {
    case .countUp:
      state.value += 1
    case .countDown:
      state.value -= 1
    }
    
    return state
  }
}
