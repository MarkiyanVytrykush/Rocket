//
//  ActivityIndicator.swift
//  RocketlaunchLive
//
//  Created by Nanter on 21.11.2020.
//

import SwiftUI

enum ActivityStyle {
  case small
  case medium
  case large

  var scale: CGFloat {
    switch self {
    case .large:
      return 1.15
    case .medium:
      return 0.65
    case .small:
      return 0.5
    }
  }
}

struct ActivityView: View {
  @Binding var isAnimating: Bool
  let style: ActivityStyle
  let color: Color
  private let count = 8
  private let width: CGFloat = 32.0

  @State private var opacities = [0.125, 0.250, 0.375, 0.5, 0.625, 0.75, 0.875, 1.0]

  func updateOpacities() {
    withAnimation {
      let opacity = opacities.removeLast()
      opacities.insert(opacity, at: 0)
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(85), execute: {
      self.updateOpacities()
    })
  }

  var body: some View {
    ZStack {
      ForEach(0..<count) { index in
        Group {
          Capsule()
            .fill(color)
            .frame(width: width / 7.4, height: width / 3.0)
            .offset(y: width / 3.25)
            .rotationEffect(.degrees(Double(360 * index / count)))
            .opacity(setOpacity(for: index))
        }
        .scaleEffect(style.scale)
      }
    }
    .frame(width: 32.0, height: 32.0)
    .onAppear {
      updateOpacities()
    }
  }

  func setOpacity(for index: Int) -> Double {
    opacities[index]
  }
}

struct ActivityView_Previews: PreviewProvider {
  static var previews: some View {
    ActivityView(isAnimating: .constant(true), style: .medium, color: .red)
      .border(Color.gray, width: 1.0)
  }
}
