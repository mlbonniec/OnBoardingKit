//
//  OnBoardingFeatureView.swift
//
//
//  Created by Mathis Le Bonniec on 13/11/2023.
//

import SwiftUI

struct OnBoardingFeatureView: View {
  var image: Image?
  var label: Text?
  var description: Text

  var body: some View {
    HStack(spacing: Constants.Spacings.small) {
      image?
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 35, height: 35)
        .foregroundStyle(.tint)

      VStack(alignment: .leading, spacing: 3) {
        label?
          .fontWeight(.semibold)

        description
          .foregroundStyle(.gray)
      }
      .font(.system(size: 16))
      .lineSpacing(3)

      Spacer(minLength: 0)
    }
    .frame(maxWidth: .infinity)
    .fixedSize(horizontal: false, vertical: true)
  }
}

#Preview("Description Only") {
  OnBoardingFeatureView(
    description: Text("Suggestions only appear if you write about them or save them to your journal.")
  )
  .padding()
}

#Preview("Image + Description") {
  OnBoardingFeatureView(
    image: Image(systemName: "lightbulb.max.fill"),
    description: Text("Suggestions only appear if you write about them or save them to your journal.")
  )
  .padding()
}

#Preview("Image + Label + Description") {
  OnBoardingFeatureView(
    image: Image(systemName: "lightbulb.max.fill"),
    label: Text("Suggestions Are Private"),
    description: Text("Suggestions only appear if you write about them or save them to your journal.")
  )
  .padding()
}
