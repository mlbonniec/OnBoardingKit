//
//  OnBoardingModel.swift
//
//
//  Created by Mathis Le Bonniec on 13/11/2023.
//

import SwiftUI
import TipKit

public enum OnBoardingKit {
  public struct Feature: Identifiable {
    public var id: UUID { UUID() }

    public var image: Image?

    public var label: Text?

    public var description: Text
  }

  public struct Notice {
    public var icon: Image?

    public var text: Text

    public var linkTitle: Text?

    public var link: String?
  }
}

public protocol OnBoarding {
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
