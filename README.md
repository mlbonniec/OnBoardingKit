# OnBoardingKit

OnBoardingKit is a configurable on boarding screen view for SwiftUI.
It's inspired by on boarding views on Apple native apps, and [UIOnboarding](https://github.com/lascic/uionboarding) Swift Package.

OnBoardingKit behavior is inspired by the new [TipKit](https://developer.apple.com/documentation/tipkit) library from Apple.

# Installation
To add the package in Xcode, go to 'File' > 'Add Package Dependencies', then type https://github.com/mlbonniec/OnBoardingKit into the search field. Finally click 'Add Package'.

# Usage
You firstly need to define a struct, heriting from the `OnBoarding` protocol. *I recommend you to create it in a separate Swift file.*  
The protocol requires some properties to be present.

```swift
import OnBoardingKit
import SwiftUI

struct MyAppOnBoarding: OnBoarding {
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
```

Then, you need to add the view to your SwiftUI view, using the `OnBoardingView(_ onBoarding: OnBoarding, action: @escaping () -> Void)`.  
The first parameter must be the previously created struct, and the second must be the action of the main button.

```swift
import OnBoardingKit
import SwiftUI

struct ContentView: View {
  @State private var showOnBoarding: Bool = true

  var body: some View {
    Text("Welcome to my app")
      .sheet(isPresented: $showOnBoarding) {
        OnBoardingView(MyAppOnBoarding()) {
          showOnBoarding = false
        }
        .interactiveDismissDisabled()
      }
  }
}
```

# License
This work is licensed under CC BY-SA 4.0.  
See [LICENSE](./LICENSE).
