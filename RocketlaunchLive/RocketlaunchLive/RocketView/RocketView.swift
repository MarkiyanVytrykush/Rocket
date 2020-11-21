//
//  RocketView.swift
//  RocketlaunchLive
//
//  Created by Nanter on 21.11.2020.
//

import Foundation
import SwiftUI

struct RocketListView : View {

  @ObservedObject var viewModel: RocketViewModel

  var body: some View {
    NavigationView {
      List {
        ForEach(viewModel.rocket.result ?? []) { rocket in
          Text(rocket.name ?? "")
        }
      }
    }
  }
}
