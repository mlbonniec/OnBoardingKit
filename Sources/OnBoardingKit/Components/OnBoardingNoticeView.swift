//
//  OnBoardingNoticeView.swift
//
//
//  Created by Mathis Le Bonniec on 14/11/2023.
//

import SwiftUI

struct OnBoardingNoticeView: View {
  // MARK: Properties
  var icon: Image?
  var text: Text
  var link: OnBoardingKit.Notice.Link?

  // MARK: Body
  var body: some View {
    VStack(spacing: Constants.Spacings.tiny) {
      icon?
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 32, height: 32)
        .clipped()
        .foregroundStyle(.tint)

      text
        .foregroundStyle(.gray)

      if let link, let url = link.url {
        Link(destination: url) {
          link.title
        }
      }
    }
    .font(.caption2)
    .frame(maxWidth: .infinity)
    .multilineTextAlignment(.center)
  }
}

#Preview("Icon + Text + Link") {
  OnBoardingNoticeView(
    icon: Image(systemName: "person.2.fill"),
    text: Text("Developed and designed for members of the Swiss Armed Forces."),
    link: OnBoardingKit.Notice.Link(
      title: Text("Learn more..."),
      url: URL(string: "https://mathislebonniec.fr")
    )
  )
  .padding()
}

#Preview("Icon + Text") {
  OnBoardingNoticeView(
    icon: Image(systemName: "person.2.fill"),
    text: Text("Developed and designed for members of the Swiss Armed Forces.")
  )
  .padding()
}

#Preview("Text Only") {
  OnBoardingNoticeView(
    text: Text("Developed and designed for members of the Swiss Armed Forces.")
  )
  .padding()
}
