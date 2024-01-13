![Cover](https://github.com/mlbonniec/OnBoardingKit/assets/29955402/cfeb845f-f2d9-478e-9b07-33de8f41eae2)
# OnBoardingKit

OnBoardingKit is a configurable on boarding screen view for SwiftUI.
It's inspired by on boarding views on Apple native apps, and [UIOnboarding](https://github.com/lascic/uionboarding) Swift Package.

OnBoardingKit behavior is inspired by the new [TipKit](https://developer.apple.com/documentation/tipkit) library from Apple.

# Quick Start
To create an on boarding view, you simply have to create a struct conforming to the `OnBoarding` protocol.
Then, it's very easy to display it with the `OnBoardingView`.

```swift
struct OnBoardingDemo: OnBoarding {
  // …
}

OnBoardingView(OnBoardingDemo())
```

# Documentation
You can find the full documentation on the [wiki](https://github.com/mlbonniec/OnBoardingKit/wiki).

# License
This work is licensed under CC BY-SA 4.0.  
See [LICENSE](./LICENSE).
