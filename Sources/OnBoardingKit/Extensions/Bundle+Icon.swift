//
//  Bundle+Icon.swift
//  
//
//  Created by Mathis Le Bonniec on 07/05/2024.
//

import SwiftUI

extension Bundle {
  public static var icon: Image? {
    if let icons = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
       let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
       let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
       let lastIcon = iconFiles.last,
       let uiImage = UIImage(named: lastIcon) {
      return Image(uiImage: uiImage)
    }

    return nil
  }
}
