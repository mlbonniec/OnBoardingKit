//
//  OnBoardingButtonView.swift
//
//
//  Created by Mathis Le Bonniec on 17/11/2023.
//

import SwiftUI

struct OnBoardingButtonView: View {
  // MARK: Properties
  let label: Text
  let action: () -> Void
  
  // MARK: Computed Properties
  var controlSize: ControlSize {
    if #available(iOS 17.0, *) {
      return .extraLarge
    } else {
      return .large
    }
  }

  // MARK: Body
  var body: some View {
    Button(action: action, label: {
      label
        .frame(maxWidth: .infinity)
    })
    .buttonStyle(.borderedProminent)
    .controlSize(controlSize)
    .buttonBorderShape(.roundedRectangle(radius: 15))
    .fontWeight(.semibold)
  }
}

#Preview {
  OnBoardingButtonView(label: Text("Continue")) {}
    .padding()
}
