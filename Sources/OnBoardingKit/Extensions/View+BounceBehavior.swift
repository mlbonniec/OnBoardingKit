//
//  View+BounceBehavior.swift
//
//
//  Created by Mathis Le Bonniec on 24/02/2024.
//

import SwiftUI

extension View {
  /// Encapsulation of scrollBounceBehavior based on size, to run on iOS 16.3 and before
  /// In those incompatible versions, the modifier will not be present, and the view will
  /// always be scrollable.
  /// - Parameters:
  ///   - axes A set of axis
  func scrollBounceBehavior(axes: Axis.Set) -> some View {
    if #available(iOS 16.4, *) {
      return self
        .scrollBounceBehavior(.basedOnSize, axes: axes)
    } else {
      return self
    }
  }
}
