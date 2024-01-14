//
//  OnBoardingHeaderView.swift
//
//
//  Created by Mathis Le Bonniec on 13/11/2023.
//

import SwiftUI

struct OnBoardingHeaderView: View {
  var image: OnBoardingKit.ImageStyle?
  var title: Text
  var description: Text?

  @State private var isAnimating = false

  var body: some View {
    VStack(alignment: .center, spacing: Constants.Spacings.large) {
      switch image {
      case .icon(let icon):
        icon
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 75, height: 75)

      case .banner(let banner, let ratio):
        banner
          .resizable()
          .aspectRatio(ratio, contentMode: .fit)

      default:
        EmptyView()
      }

      Group {
        title
          .font(.largeTitle)
          .bold()
          .fixedSize()

        description?
          .font(.callout)
          .foregroundStyle(.gray)
      }
      .multilineTextAlignment(.center)
      .padding(.horizontal, Constants.Spacings.large)
    }
    .frame(maxWidth: .infinity)
    .fixedSize(horizontal: false, vertical: true)
  }
}

#Preview("Title Only") {
  OnBoardingHeaderView(
    title: Text("First steps\nwith OnBoarding")
  )
}

#Preview("Image Icon + Title") {
  OnBoardingHeaderView(
    image: .icon(Image(systemName: "square.fill")),
    title: Text("First steps\nwith OnBoarding")
  )
}

#Preview("Image Icon + Title + Description") {
  OnBoardingHeaderView(
    image: .icon(Image(systemName: "square.fill")),
    title: Text("First steps\nwith OnBoarding"),
    description: Text("Discover how to use this awesome Apple like on boarding view library")
  )
}

#Preview("Image Banner + Title + Description") {
  OnBoardingHeaderView(
    image: .banner(Image(.banner)),
    title: Text("First steps\nwith OnBoarding"),
    description: Text("Discover how to use this awesome Apple like on boarding view library")
  )
}
