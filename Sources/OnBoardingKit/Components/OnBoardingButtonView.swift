//
//  OnBoardingButtonView.swift
//
//
//  Created by Mathis Le Bonniec on 17/11/2023.
//

import SwiftUI

struct OnBoardingButtonView: View {
  let label: Text
  let action: () -> Void
  
  var body: some View {
    Button(action: action, label: {
      label
        .frame(maxWidth: .infinity)
    })
    .buttonStyle(.borderedProminent)
    .controlSize(.extraLarge)
    .buttonBorderShape(.roundedRectangle(radius: 15))
    .fontWeight(.semibold)
  }
}

#Preview {
  OnBoardingButtonView(label: Text("Continue")) {}
}
