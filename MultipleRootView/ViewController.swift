//
//  ViewController.swift
//  MultipleRootView
//
//  Created by 구본욱 on 2023/03/15.
//

import UIKit

class ViewController: UIViewController {

  private enum Child: String {
    case rgb, cmyk
  }

  private var currentChild: Child = .rgb {
    didSet {
      self.title = self.currentChild.rawValue.uppercased()
    }
  }
  private lazy var rgbVC = RGBViewController()
  private lazy var cmykVC = CMYKViewController()
  private var changeButton: UIBarButtonItem!

  var parentRequestable: RootNaviRequestable?
  var childRequestables: [RootNaviRequestable] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "RGB"
    self.add(asChildViewController: self.rgbVC)
    let changeAction = UIAction(title: "전환") { action in
      self.switchChildView()
    }
    self.changeButton = UIBarButtonItem(systemItem: .refresh, primaryAction: changeAction)
    self.navigationItem.setLeftBarButton(self.changeButton, animated: false)

    self.rgbVC.parentRequestable = self
    self.cmykVC.parentRequestable = self
    self.childRequestables.append(contentsOf: [self.rgbVC, self.cmykVC])
  }
}

extension ViewController {
  private func switchChildView() {
    if currentChild == .rgb {
      self.remove(asChildViewController: self.rgbVC)
      self.add(asChildViewController: self.cmykVC)
      self.currentChild = .cmyk
    } else {
      self.remove(asChildViewController: self.cmykVC)
      self.add(asChildViewController: self.rgbVC)
      self.currentChild = .rgb
    }
  }

  private func add(asChildViewController viewController: UIViewController) {
    self.addChild(viewController)
    self.view.addSubview(viewController.view)
    NSLayoutConstraint.activate([
      viewController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
      viewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
      viewController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      viewController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
    ])
    viewController.didMove(toParent: self)
  }

  private func remove(asChildViewController viewController: UIViewController) {
    viewController.willMove(toParent: nil)
    viewController.view.removeFromSuperview()
    viewController.removeFromParent()
  }
}

extension ViewController: RootNaviRequestable {
  func requestSwitchNaviButtonLocation() -> Bool {
    if self.navigationItem.leftBarButtonItem == self.changeButton {
      self.navigationItem.setLeftBarButton(nil, animated: true)
      self.navigationItem.setRightBarButton(self.changeButton, animated: true)
    } else {
      self.navigationItem.setRightBarButton(nil, animated: true)
      self.navigationItem.setLeftBarButton(self.changeButton, animated: true)
    }
    return true
  }
}
