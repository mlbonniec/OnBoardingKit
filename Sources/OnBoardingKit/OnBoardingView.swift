// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct OnBoardingView: View {
  // MARK: Properties
  private let onBoarding: OnBoarding

  // MARK: Reactive Properties
  @State private var buttonsHeight: CGFloat = .zero

  // MARK: Lifecycle
  public init(_ onBoarding: OnBoarding) {
    self.onBoarding = onBoarding
  }

  // MARK: Body
  public var body: some View {
    ZStack {
      GeometryReader { proxy in
        ScrollView {
          VStack(spacing: Constants.Spacings.medium) {
            OnBoardingHeaderView(
              image: onBoarding.image,
              title: onBoarding.title,
              description: onBoarding.description
            )

            Spacer()

            VStack(spacing: 32) {
              ForEach(onBoarding.features) { feature in
                OnBoardingFeatureView(
                  image: feature.image,
                  label: feature.label,
                  description: feature.description
                )
              }
            }

            Spacer()
          }
          .padding(Constants.Spacings.large)
          .padding(.bottom, buttonsHeight)
          .frame(minHeight: proxy.size.height)
        }
      }
      .frame(maxWidth: .infinity)

      VStack {
        Spacer(minLength: 0)


        VStack(spacing: Constants.Spacings.large) {
          if let notice = onBoarding.notice {
            OnBoardingNoticeView(
              icon: notice.icon,
              text: notice.text,
              linkTitle: notice.linkTitle,
              link: notice.link
            )
          }

          Button("Continue") {}
            .buttonStyle(.large)
        }
        .padding(Constants.Spacings.large)
        .background(
          GeometryReader { proxy in
            BlurView(style: .regular).onAppear {
              buttonsHeight = proxy.size.height
            }
            .ignoresSafeArea()
          }
        )
      }
    }
  }
}

#Preview {
  struct ScrollViewOnBoarding: OnBoarding {
    var image: Image? {
      Image(.shortcuts)
    }

    var title: Text {
      Text("Journaling\nSuggestions")
    }

    var description: Text? {
      Text("iPhone uses on-device intelligence to create journaling suggestions based on your everyday moments.")
    }

    var features: [Feature] {
      [
        Feature(
          image: .init(systemName: "hand.raised.fill"),
          label: .init("Get Inspired"),
          description: .init("Summaries can help you reflect on topics you might want to write about, such as places you go and photos you take.")
        ),
        Feature(
          image: .init(systemName: "lightbulb.max.fill"),
          label: .init("Suggestions Are Private"),
          description: .init("Suggestions only appear if you write about them or save them to your journal.")
        ),
        Feature(
          image: .init(systemName: "lightbulb.max.fill"),
          label: .init("Suggestions Are Private"),
          description: .init("Suggestions only appear if you write about them or save them to your journal.")
        ),
        Feature(
          image: .init(systemName: "lightbulb.max.fill"),
          label: .init("Suggestions Are Private"),
          description: .init("Suggestions only appear if you write about them or save them to your journal.")
        )
      ]
    }

    var notice: Notice? {
      Notice(
        icon: Image(systemName: "person.2.fill"),
        text: Text("Developed and designed for members of the Swiss Armed Forces."),
        linkTitle: Text("Learn more..."),
        link: "https://mathislebonniec.fr"
      )
    }
  }

  return Text("Preview Sheet")
    .sheet(isPresented: .constant(true)) {
      OnBoardingView(ScrollViewOnBoarding())
        .interactiveDismissDisabled()
    }
}
