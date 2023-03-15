//
//  RootNaviRequestable.swift
//  MultipleRootView
//
//  Created by 구본욱 on 2023/03/15.
//

import Foundation

protocol RootNaviRequestable: AnyObject {
  var parentRequestable: RootNaviRequestable? { get set }
  var childRequestables: [RootNaviRequestable] { get set }

  @discardableResult func requestSwitchNaviButtonLocation() -> Bool
}

extension RootNaviRequestable {
  func requestSwitchNaviButtonLocation() -> Bool {
    return self.parentRequestable?.requestSwitchNaviButtonLocation() ?? false
  }
}
