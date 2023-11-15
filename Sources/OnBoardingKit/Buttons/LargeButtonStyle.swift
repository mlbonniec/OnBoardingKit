//
//  LargeButtonStyle.swift
//
//
//  Created by Mathis Le Bonniec on 13/11/2023.
//

import SwiftUI

struct LargeButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(maxWidth: .infinity)
      .frame(height: 50)
      .background(Color.accentColor)
      .clipShape(RoundedRectangle(cornerRadius: 15))
      .font(.headline)
      .foregroundStyle(.white)
      .opacity(configuration.isPressed ? 0.5 : 1)
  }
}

extension ButtonStyle where Self == LargeButtonStyle {
  internal static var large: LargeButtonStyle {
    LargeButtonStyle()
  }
}

#Preview {
  Button(action: {}, label: {
    Text("Press Me")
  })
  .buttonStyle(.large)
  .padding()
}
