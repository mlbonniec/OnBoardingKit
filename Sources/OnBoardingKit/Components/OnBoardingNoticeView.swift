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
  var linkTitle: Text?
  var link: URL?

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

      if let link {
        Link(destination: link) {
          linkTitle
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
    linkTitle: Text("Learn more..."),
    link: URL(string: "https://mathislebonniec.fr")
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
