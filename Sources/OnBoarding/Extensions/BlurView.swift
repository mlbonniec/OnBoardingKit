//
//  BlurView.swift
//
//
//  Created by Mathis Le Bonniec on 13/11/2023.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
  let style: UIBlurEffect.Style

  func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
    UIVisualEffectView()
  }

  func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
    uiView.effect = UIBlurEffect(style: style)
  }
}
