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
          Text("\(rocket.name ?? "")")
        }
        if viewModel.rocketListFull == false {
          ActivityView(isAnimating: self.$viewModel.rocketListFull,
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
