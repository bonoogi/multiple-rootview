//
//  RGBViewController.swift
//  MultipleRootView
//
//  Created by 구본욱 on 2023/03/15.
//

import UIKit

final class RGBViewController: UITabBarController, RootNaviRequestable {

  weak var parentRequestable: RootNaviRequestable?
  var childRequestables: [RootNaviRequestable] = []

  private lazy var redVC: UIViewController = {
    let view = CommonColorViewController(color: .red)
    view.tabBarItem = UITabBarItem(title: "RED", image: UIImage(systemName: "1.lane"), tag: 0)
    view.parentRequestable = self
    self.childRequestables.append(view)
    return view
  }()

  private lazy var greenVC: UIViewController = {
    let view = CommonColorViewController(color: .green)
    view.tabBarItem = UITabBarItem(title: "GREEN", image: UIImage(systemName: "2.lane"), tag: 1)
    view.parentRequestable = self
    self.childRequestables.append(view)
    return view
  }()

  private lazy var blueVC: UIViewController = {
    let view = CommonColorViewController(color: .blue)
    view.tabBarItem = UITabBarItem(title: "BLUE", image: UIImage(systemName: "3.lane"), tag: 2)
    view.parentRequestable = self
    self.childRequestables.append(view)
    return view
  }()

  deinit {
    guard let childs = self.parentRequestable?.childRequestables, let meIndex = childs.firstIndex(where: { $0 === self }) else {
      return
    }
    self.parentRequestable?.childRequestables.remove(at: meIndex)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    printDetail(message: "")

    self.setViewControllers(
      [
        HiddenNavigationController(rootViewController: self.redVC),
        HiddenNavigationController(rootViewController: self.greenVC),
        HiddenNavigationController(rootViewController: self.blueVC)
      ],
      animated: false
    )
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    printDetail(message: "")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    printDetail(message: "")
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    printDetail(message: "")
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    printDetail(message: "")
  }
}
