//
//  OnBoardingHeaderView.swift
//
//
//  Created by Mathis Le Bonniec on 13/11/2023.
//

import SwiftUI

struct OnBoardingHeaderView: View {
  // MARK: Properties
  var image: OnBoardingKit.ImageStyle?
  var title: Text
  var description: Text?

  // MARK: Reactive Properties
  @State private var isAnimating: Bool

  // MARK: Lifecycle
  init(image: OnBoardingKit.ImageStyle? = nil, title: Text, description: Text? = nil, animate: Bool) {
    self.image = image
    self.title = title
    self.description = description
    self.isAnimating = !animate
  }

  // MARK: Body
  var body: some View {
    VStack(alignment: .center, spacing: Constants.Spacings.large) {
      switch image {
      case .icon(let icon):
        icon
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 75, height: 75)
          .foregroundStyle(.tint)

      case .banner(let banner, let ratio):
        Color.clear
          .aspectRatio(ratio, contentMode: .fit)
          .background(
            banner
              .resizable()
              .scaledToFill()
          )
          .clipped()
      case .none:
        EmptyView()
      }

      Group {
        title
          .font(.largeTitle)
          .bold()

        description?
          .font(.callout)
          .foregroundStyle(.gray)
      }
      .multilineTextAlignment(.center)
      .padding(.horizontal, Constants.Spacings.large)
    }
    .frame(maxWidth: .infinity)
    .opacity(isAnimating ? 1 : 0)
    .scaleEffect(isAnimating ? 1.0 : 0.5)
    .onAppear {
      withAnimation(.easeInOut(duration: 0.8)) {
        isAnimating = true
      }
    }
  }
}

#Preview("Title Only") {
  OnBoardingHeaderView(
    title: Text("First steps with OnBoardingKit"),
    animate: true
  )
}

#Preview("Image Icon + Title") {
  OnBoardingHeaderView(
    image: .icon(Image(systemName: "square.fill")),
    title: Text("First steps with OnBoardingKit"),
    animate: true
  )
}

#Preview("Image Icon + Title + Description") {
  OnBoardingHeaderView(
    image: .icon(Image(systemName: "square.fill")),
    title: Text("First steps with OnBoardingKit"),
    description: Text("Discover how to use this awesome Apple like on boarding view library"),
    animate: true
  )
}

#Preview("Image Banner + Title + Description") {
  OnBoardingHeaderView(
    image: .banner(Image(.banner)),
    title: Text("First steps with OnBoardingKit"),
    description: Text("Discover how to use this awesome Apple like on boarding view library"),
    animate: true
  )
}


#Preview("Image Banner with a big aspect-ratio") {
  OnBoardingHeaderView(
    image: .banner(Image(.banner), 3),
    title: Text("First steps with OnBoardingKit"),
    animate: true
  )
}
