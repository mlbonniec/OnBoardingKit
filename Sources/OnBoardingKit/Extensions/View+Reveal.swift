//
//  View+Reveal.swift
//
//
//  Created by Mathis Le Bonniec on 16/11/2023.
//

import SwiftUI

private struct RevealingView: ViewModifier {
  // MARK: Properties
  var visible: Bool
  var delay: TimeInterval
  
  // MARK: Private Properties
  @State private var size: CGSize = .zero
  
  // MARK: Body
  func body(content: Content) -> some View {
    content
      .background( GeometryReader { proxy in Color.clear.onAppear { size = proxy.size }})
      .offset(y: visible ? 0 : 0.5 * size.height)
      .opacity(visible ? 1 : 0)
      .animation(.easeInOut(duration: 0.466).delay(delay), value: visible)
  }
}

extension View {
  func reveal(visible: Bool, delay: TimeInterval = .zero) -> some View {
    self
      .modifier(RevealingView(visible: visible, delay: delay))
  }
}
