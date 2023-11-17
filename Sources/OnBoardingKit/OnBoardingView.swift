import SwiftUI

public struct OnBoardingView: View {
  // MARK: Properties
  private let onBoarding: OnBoarding
  private let action: () -> Void

  // MARK: Reactive Properties
  @State private var buttonsHeight: CGFloat = .zero

  // MARK: Lifecycle
  public init(_ onBoarding: OnBoarding, action: @escaping () -> Void) {
    self.onBoarding = onBoarding
    self.action = action
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
            .fixedSize(horizontal: false, vertical: true)

            Spacer()

            VStack(spacing: Constants.Spacings.xlarge) {
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
          .padding(.horizontal, Constants.Spacings.large)
          .padding(.top, Constants.Spacings.xlarge)
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
}

#Preview {
  struct ScrollViewOnBoarding: OnBoarding {
    var image: Image? {
      Image(systemName: "app.fill")
    }

    var title: Text {
      Text("Get into\nOnBoardingKit")
    }

    var description: Text? {
      Text("Apple TipKit like architecture OnBoarding view Swift Package.")
    }

    var features: [Feature] {
      [
        Feature(
          image: Image(systemName: "gear"),
          label: Text("Configurable"),
          description: Text("Every element in the view can be configured. You can hide labels, text, images depending on your needs")
        ),
        Feature(
          image: Image(systemName: "apple.logo"),
          label: Text("Apple Like"),
          description: Text("The design is inspired by the on boarding screens you can find on iMovie, Pages, Keynote etc.")
        ),
        Feature(
          image: Image(systemName: "apple.logo"),
          label: Text("Apple Like"),
          description: Text("The design is inspired by the on boarding screens you can find on iMovie, Pages, Keynote etc.")
        ),
        Feature(
          image: Image(systemName: "apple.logo"),
          label: Text("Apple Like"),
          description: Text("The design is inspired by the on boarding screens you can find on iMovie, Pages, Keynote etc.")
        ),
        Feature(
          image: Image(systemName: "apple.logo"),
          label: Text("Apple Like"),
          description: Text("The design is inspired by the on boarding screens you can find on iMovie, Pages, Keynote etc.")
        )
      ]
    }

    var notice: Notice? {
      Notice(
        icon: Image(systemName: "desktopcomputer"),
        text: Text("This project is open-source, and you can contribute to it."),
        linkTitle: Text("Learn more..."),
        link: "https://github.com/mlbonniec/OnBoardingKit"
      )
    }

    var button: Text {
      Text("Continue")
    }
  }

  return Text("Preview Sheet")
    .sheet(isPresented: .constant(true)) {
      OnBoardingView(ScrollViewOnBoarding()) {}
        .interactiveDismissDisabled()
        // .tint(.orange)
    }
}
