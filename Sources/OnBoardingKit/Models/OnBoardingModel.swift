//
//  OnBoardingModel.swift
//
//
//  Created by Mathis Le Bonniec on 13/11/2023.
//

import SwiftUI

public enum OnBoardingKit {
  public struct Feature: Identifiable {
    public var id: UUID { UUID() }

    public var image: Image?

    public var label: Text?

    public var description: Text

    public init(image: Image? = nil, label: Text? = nil, description: Text) {
      self.image = image
      self.label = label
      self.description = description
    }
  }

  public struct Notice {
    public var icon: Image? = nil

    public var text: Text

    public var linkTitle: Text? = nil

    public var link: URL? = nil

    public init(icon: Image? = nil, text: Text, linkTitle: Text? = nil, link: URL? = nil) {
      self.icon = icon
      self.text = text
      self.linkTitle = linkTitle
      self.link = link
    }
  }

  public enum ImageStyle {
    case icon(Image), banner(Image, CGFloat? = 1.1)
  }
}

public protocol OnBoarding {
  var image: ImageStyle? { get }

  var title: Text { get }

  var description: Text? { get }

  var features: [Feature] { get }

  var notice: Notice? { get }

  var button: Text { get }
}

public extension OnBoarding {
  typealias Feature = OnBoardingKit.Feature

  typealias Notice = OnBoardingKit.Notice

  typealias ImageStyle = OnBoardingKit.ImageStyle
}

public extension OnBoarding {
  var image: ImageStyle? { nil }

  var description: Text? { nil }

  var features: [Feature] { [] }

  var notice: Notice? { nil }
}
