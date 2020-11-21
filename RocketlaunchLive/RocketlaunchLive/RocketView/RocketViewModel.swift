//
//  RocketViewModel.swift
//  RocketlaunchLive
//
//  Created by Nanter on 21.11.2020.
//

import Foundation
import Combine

final class RocketViewModel: ObservableObject {

  private let netService: NetService

  @Published var membersListFull = false
  @Published var currentPage = 0
  @Published var perPages = 5
  @Published var rocket = Rocket()
  private var subscriptions = Set<AnyCancellable>()

  init(netService: NetService = NetService()) {
    self.netService = netService
    self.fetchRocket(next: currentPage + 1)
  }
  
  private func fetchRocket(next: Int) {
    netService.requestPublisher(url: "https://fdo.rocketlaunch.live/json/launches/next/" + "\(next)",
                                httpMethod: .get,
                                responseType: Rocket.self)
      .sink { completion in
        if case .failure(let error) = completion {
          print("completion: \(error.localizedDescription)")
        }
      } receiveValue: { rocket in
        DispatchQueue.main.async {
          self.rocket = rocket
        }
      }.store(in: &subscriptions)
  }
}
