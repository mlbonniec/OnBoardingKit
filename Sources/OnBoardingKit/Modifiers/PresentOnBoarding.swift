//
//  PresentOnBoarding.swift
//
//
//  Created by Mathis Le Bonniec on 15/01/2024.
//

import SwiftUI

public struct OnBoardingPresentation: ViewModifier {
  // MARK: Properties
  public let onBoarding: OnBoarding
  public let mode: Mode
  public let action: () -> Void
  public enum Mode {
    case sheet, fullscreen
  }

  // MARK: Reactive Properties
  @State private var isPresented: Bool = false
  @AppStorage(OnBoardingAppStorage.hasOnBoardingBeenPresented.rawValue) private var hasBeenPresented: Bool = false

  // MARK: Body
  public func body(content: Content) -> some View {
    switch mode {
    case .sheet:
      initialContent(content: content)
        .sheet(isPresented: $isPresented) {
          onBoardingView
            .interactiveDismissDisabled()
        }
    case .fullscreen:
      initialContent(content: content)
        .fullScreenCover(isPresented: $isPresented) {
          onBoardingView
        }
    }
  }

  private var onBoardingView: OnBoardingView {
    OnBoardingView(onBoarding) {
      hasBeenPresented = true
      isPresented = false
      action()
    }
  }

  private func initialContent(content: Content) -> some View {
    content
      .onAppear {
        if !hasBeenPresented {
          isPresented = true
        }
      }
  }
}

extension View {
  public func presentOnBoarding(
    _ onBoarding: OnBoarding,
    mode: OnBoardingPresentation.Mode = .fullscreen,
    action: @escaping () -> Void = {}
  ) -> some View {
    self
      .modifier(OnBoardingPresentation(onBoarding: onBoarding, mode: mode, action: action))
  }
}
