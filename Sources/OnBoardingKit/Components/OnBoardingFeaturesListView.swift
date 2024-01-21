//
//  OnBoardingFeaturesListView.swift
//
//
//  Created by Mathis Le Bonniec on 20/01/2024.
//

import SwiftUI

struct OnBoardingFeaturesListView: View {
  // MARK: Private Properties
  private let features: [OnBoarding.Feature]
  private let animate: Bool

  // MARK: Lifecycle
  init(features: [OnBoarding.Feature], animate: Bool) {
    self.features = features
    self.animate = animate
    self._isAnimating = State(initialValue: Array(
      repeating: !animate,
      count: features.count
    ))
  }

  // MARK: Reactive Properties
  @State private var isAnimating: [Bool]

  // MARK: Body
  var body: some View {
    VStack(spacing: Constants.Spacings.xlarge) {
      ForEach(Array(zip(features.indices, features)), id: \.0) { index, feature in
        OnBoardingFeatureView(
          image: feature.image,
          label: feature.label,
          description: feature.description
        )
        .opacity(isAnimating[index] ? 1 : 0)
        .offset(y: isAnimating[index] ? 0 : 100)
        .onAppear {
          withAnimation(.easeInOut(duration: 0.8).delay(1.6 + Double(index) * 0.15)) {
            isAnimating[index] = true
          }
        }
      }
    }
  }
}

#Preview("Non-animated Single list") {
  OnBoardingFeaturesListView(
    features: Array(
      repeating: OnBoarding.Feature(
        image: Image(systemName: "pencil"),
        label: Text("Some label"),
        description: Text("Some description that's longer.")
      ),
      count: 3
    ),
    animate: true
  )
  .padding()
}


#Preview("Animated Single list") {
  OnBoardingFeaturesListView(
    features: Array(
      repeating: OnBoarding.Feature(
        image: Image(systemName: "pencil"),
        label: Text("Some label"),
        description: Text("Some description that's longer.")
      ),
      count: 3
    ),
    animate: true
  )
  .padding()
}
