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

  @Published var rocketListFull = false
  @Published var isLoading = true
  @Published var currentPage = 0
  @Published var perPages = 5
  @Published var rocket = Rocket()
  
  private var subscriptions = Set<AnyCancellable>()

  init(netService: NetService = NetService()) {
    self.netService = netService
    self.fetchRocket()
  }
  
  func fetchRocket() {
    isLoading = true
    netService.requestPublisher(url: "https://fdo.rocketlaunch.live/json/launches/next/" + "\(currentPage + 1)",
                                httpMethod: .get,
                                responseType: Rocket.self)
      .sink { completion in
        if case .failure(let error) = completion {
          self.isLoading = false
          print("completion: \(error.localizedDescription)")
        }
      } receiveValue: { rocket in
        DispatchQueue.main.async {
          self.isLoading = false
          if rocket.count ?? 0 < self.perPages {
            self.rocketListFull = true
          }
          self.rocket = rocket
        }
      }.store(in: &subscriptions)
  }
}
