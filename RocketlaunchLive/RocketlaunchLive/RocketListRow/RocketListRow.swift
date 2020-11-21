//
//  RocketView.swift
//  RocketlaunchLive
//
//  Created by Nanter on 21.11.2020.
//

import Foundation
import SwiftUI
import Combine

struct RocketRow: View {
  @ObservedObject var viewModel: RocketRowViewModel

  var body: some View {
    NavigationLink(destination: RocketDetailView(viewModel: RocketDetailViewModel(rocketResult: viewModel.rocketResult))) {
      Text("\(viewModel.rocketResult.name ?? "")")
    }
  }
}
