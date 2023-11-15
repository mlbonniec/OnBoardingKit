//
//  OnBoardingModel.swift
//
//
//  Created by Mathis Le Bonniec on 13/11/2023.
//

import SwiftUI
import TipKit

enum OnBoardingKit {
  struct Feature: Identifiable {
    var id: UUID { UUID() }

    var image: Image?

    var label: Text?

    var description: Text
  }

  struct Notice {
    var icon: Image?

    var text: Text

    var linkTitle: Text?

    var link: String?
  }
}

protocol OnBoarding {
  var image: Image? { get }

  var title: Text { get }

  var description: Text? { get }

  var features: [Feature] { get }

  var notice: Notice? { get }

  var button: Text { get }

  typealias Feature = OnBoardingKit.Feature
  typealias Notice = OnBoardingKit.Notice
}

extension OnBoarding {
  var image: Image? { nil }

  var description: Text? { nil }

  var notice: Notice? { nil }

  var button: Text {
    Text("Continue")
  }
}
