//
//  CommonColors.swift
//  MultipleRootView
//
//  Created by 구본욱 on 2023/03/15.
//

import UIKit

enum CommonColor: String {
  case red, green, blue, cyan, magenta, yellow, key

  static var rgb: [CommonColor] {
    return [.red, .green, .blue]
  }

  static var cmyk: [CommonColor] {
    return [.cyan, .magenta, .yellow, .key]
  }

  var uiColor: UIColor {
    switch self {
    case .red:
      return .red
    case .green:
      return .green
    case .blue:
      return .blue
    case .cyan:
      return .cyan
    case .magenta:
      return .magenta
    case .yellow:
      return .yellow
    case .key:
      return .black
    }
  }
}
