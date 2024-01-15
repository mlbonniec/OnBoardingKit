//
//  OnBoardingPresentationModel.swift
//  
//
//  Created by Mathis Le Bonniec on 15/01/2024.
//

import Foundation

extension OnBoardingKit {
  static func resetDatastore() {
    UserDefaults.standard.removeObject(forKey: OnBoardingAppStorage.hasOnBoardingBeenPresented.rawValue)
  }
}

internal enum OnBoardingAppStorage: String {
  case hasOnBoardingBeenPresented
}
