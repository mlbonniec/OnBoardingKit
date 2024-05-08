![Cover](https://github.com/mlbonniec/OnBoardingKit/assets/29955402/db543528-b91e-4d28-ab30-e7a9e92272de)
*All of these views are original Apple views, recreated using the library.*

# OnBoardingKit

OnBoardingKit is a configurable on boarding screen view for SwiftUI.
It's inspired by on boarding views on Apple native apps, and [UIOnboarding](https://github.com/lascic/uionboarding) Swift Package.

OnBoardingKit behavior is inspired by the new [TipKit](https://developer.apple.com/documentation/tipkit) library from Apple.

> [!NOTE]
> OnBoardingKit is available on iOS 15 and later.

# Quick Start
To create an on boarding view, you simply have to create a struct conforming to the `OnBoarding` protocol.
Then, it's very easy to display it with the `OnBoardingView`.

```swift
struct OnBoardingDemo: OnBoarding {
  // …
}

Text("Hello, World!")
  .presentOnBoarding(OnBoardingDemo(), action: {})
```

# Documentation
You can find the full documentation on the [wiki](https://github.com/mlbonniec/OnBoardingKit/wiki).

# License
This work is licensed under CC BY-SA 4.0.  
See [LICENSE](./LICENSE).
