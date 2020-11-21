//
//  RocketDetailViewModel.swift
//  RocketlaunchLive
//
//  Created by Nanter on 21.11.2020.
//

import Foundation
import Combine

final class RocketDetailViewModel: ObservableObject {

  @Published var rocketResult = Result()

  init(rocketResult: Result) {
    self.rocketResult = rocketResult
  }

}
