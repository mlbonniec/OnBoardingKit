//
//  UIDevice+Device.swift
//  OnBoardingKit
//
//  Created by Mathis Le Bonniec on 11/16/25.
//

import UIKit

extension UIDevice {
  /// - Returns: `true` if the current device is an Apple Vision Pro
  var isVisionPro: Bool {
    userInterfaceIdiom == .vision
  }
}
