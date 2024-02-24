import SwiftUI

public struct OnBoardingView: View {
  // MARK: Properties
  private let onBoarding: OnBoarding
  private let animate: Bool
  private let action: () -> Void

  private var isBannerStyle: Bool {
    if case .banner = self.onBoarding.image {
      return true
    }
    return false
  }

  // MARK: Reactive Properties
  @State private var buttonsHeight: CGFloat
  @State private var isAnimating: Bool

  // MARK: Lifecycle
  public init(
    _ onBoarding: OnBoarding,
    animate: Bool = false,
    action: @escaping () -> Void
  ) {
    self.onBoarding = onBoarding
    self.animate = animate
    self.action = action
    self._isAnimating = State(initialValue: !animate)
    self._buttonsHeight = State(initialValue: .zero)
  }

  // MARK: Body
  public var body: some View {
    ZStack {
      GeometryReader { proxy in
        ScrollView {
          VStack(spacing: Constants.Spacings.xxlarge) {
            OnBoardingHeaderView(
              image: onBoarding.image,
              title: onBoarding.title,
              description: onBoarding.description,
              animate: animate
            )
            .padding(.top, isBannerStyle ? -proxy.safeAreaInsets.top : Constants.Spacings.xlarge)
            .offset(y: isAnimating ? 0 : 200)

            OnBoardingFeaturesListView(
              features: onBoarding.features,
              animate: animate
            )
            .padding(.horizontal, Constants.Spacings.large)

            Spacer()
          }
          .padding(.bottom, buttonsHeight)
        }
        .scrollBounceBehavior(axes: .vertical)
      }
      .frame(maxWidth: .infinity)

      footer
        .opacity(isAnimating ? 1 : 0)
    }
    .onAppear {
      withAnimation(.easeInOut(duration: 0.8).delay(1.4)) {
        isAnimating = true
      }
    }
  }

  private var footer: some View {
    VStack {
      Spacer(minLength: 0)

      VStack(spacing: Constants.Spacings.large) {
        if let notice = onBoarding.notice {
          OnBoardingNoticeView(
            icon: notice.icon,
            text: notice.text,
            link: notice.link
          )
        }

        OnBoardingButtonView(label: onBoarding.button, action: action)
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

#Preview {
  struct ScrollViewOnBoarding: OnBoarding {
    var image: ImageStyle? {
      .icon(Image(systemName: "app.fill"))
    }

    var title: Text {
      Text("Get into OnBoardingKit")
    }

    var description: Text? {
      Text("Apple TipKit like architecture OnBoarding view Swift Package.")
    }

    var features: [Feature] {
      [
        Feature(
          image: Image(systemName: "apple.logo"),
          label: Text("Apple Like"),
          description: Text("The design is inspired by the on boarding screens you can find on iMovie, Pages, Keynote etc.")
        ),
        Feature(
          image: Image(systemName: "gear"),
          label: Text("Configurable"),
          description: Text("Every element in the view can be configured. You can hide labels, text, images depending on your needs")
        ),
        Feature(
          image: Image(systemName: "lightbulb.fill"),
          label: Text("TipKit architecture like"),
          description: Text("The project architecture is inspired by the Apple TipKit library.")
        )
      ]
    }

    var notice: Notice? {
      Notice(
        icon: Image(systemName: "desktopcomputer"),
        text: Text("This project is open-source, and you can contribute to it."),
        link: Link(
          title: Text("Learn more..."),
          url: URL(string: "https://github.com/mlbonniec/OnBoardingKit")
        )
      )
    }

    var button: Text {
      Text("Continue")
    }
  }

  return OnBoardingView(ScrollViewOnBoarding()) {}
}
