//
//  HiddenNavigationController.swift
//  MultipleRootView
//
//  Created by 구본욱 on 2023/03/15.
//

import UIKit

final class HiddenNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.setNavigationBarHidden(true, animated: false)
  }
}
