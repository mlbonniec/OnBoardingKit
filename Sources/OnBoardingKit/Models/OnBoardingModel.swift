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

    public var image: Image? = nil

    public var label: Text? = nil

    public var description: Text
  }

  public struct Notice {
    public var icon: Image? = nil

    public var text: Text

    public var linkTitle: Text? = nil

    public var link: String? = nil
  }
}

public protocol OnBoarding {
  var image: Image? { get }

  var title: Text { get }

  var description: Text? { get }

  var features: [Feature] { get }

  var notice: Notice? { get }

  var button: Text { get }
}

public extension OnBoarding {
  typealias Feature = OnBoardingKit.Feature

  typealias Notice = OnBoardingKit.Notice
}

public extension OnBoarding {
  var image: Image? { nil }

  var description: Text? { nil }

  var notice: Notice? { nil }
}
