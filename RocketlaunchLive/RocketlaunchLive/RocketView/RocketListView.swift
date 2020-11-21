//
//  RocketView.swift
//  RocketlaunchLive
//
//  Created by Nanter on 21.11.2020.
//

import Foundation
import SwiftUI
import Combine

struct RocketListView: View {
  @ObservedObject var viewModel: RocketViewModel

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.rocket.result ?? []) { rocket in
          RocketRow(viewModel: RocketRowViewModel(rocketResult: rocket))
        }
        if viewModel.rocketListFull == false {
          ActivityView(isAnimating: self.$viewModel.isLoading,
                       style: .small,
                       color: .black)
            .onAppear {
              viewModel.fetchRocket()
            }
        }
      }
      .navigationBarTitle("Rocket")
    }
  }
}
