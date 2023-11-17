//
//  OnBoardingHeaderView.swift
//
//
//  Created by Mathis Le Bonniec on 13/11/2023.
//

import SwiftUI

struct OnBoardingHeaderView: View {
  var image: Image?
  var title: Text
  var description: Text?

  var body: some View {
    VStack(alignment: .center, spacing: Constants.Spacings.medium) {
      image?
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 75, height: 75)
        .foregroundStyle(.tint)

      title
        .font(.largeTitle)
        .bold()
        .multilineTextAlignment(.center)
        .fixedSize()

      description?
        .font(.callout)
        .multilineTextAlignment(.center)
        .foregroundStyle(.gray)
    }
    .frame(maxWidth: .infinity)
  }
}

#Preview("Title Only") {
  OnBoardingHeaderView(
    title: Text("First steps\nwith OnBoarding")
  )
}

#Preview("Image + Title") {
  OnBoardingHeaderView(
    image: Image(systemName: "square.fill"),
    title: Text("First steps\nwith OnBoarding")
  )
}

#Preview("Image + Title + Description") {
  OnBoardingHeaderView(
    image: Image(systemName: "square.fill"),
    title: Text("First steps\nwith OnBoarding"),
    description: Text("Discover how to use this awesome Apple like on boarding view library")
  )
}
