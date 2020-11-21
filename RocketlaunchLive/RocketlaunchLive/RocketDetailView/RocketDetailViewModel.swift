//
//  RocketDetailViewModel.swift
//  RocketlaunchLive
//
//  Created by Nanter on 21.11.2020.
//

import Foundation
import Combine

final class RocketDetailViewModel: ObservableObject {
  
  private let netService: NetService

  @Published var membersListFull = false
  @Published var currentPage = 0
  @Published var perPages = 5
  @Published var rocket = Rocket()

  init(netService: NetService = NetService()) {
    self.netService = netService
  }

}
