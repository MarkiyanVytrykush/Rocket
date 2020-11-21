//
//  RocketlaunchLiveApp.swift
//  RocketlaunchLive
//
//  Created by Nanter on 21.11.2020.
//

import SwiftUI

@main
struct RocketlaunchLiveApp: App {
  var body: some Scene {
    WindowGroup {
      RocketListView(viewModel:.init())
    }
  }
}
