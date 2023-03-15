//
//  CMYKViewController.swift
//  MultipleRootView
//
//  Created by 구본욱 on 2023/03/15.
//

import UIKit

final class CMYKViewController: UITabBarController, RootNaviRequestable {

  weak var parentRequestable: RootNaviRequestable?
  var childRequestables: [RootNaviRequestable] = []

  private lazy var cyanVC: UIViewController = {
    let view = CommonColorViewController(color: .cyan)
    view.tabBarItem = UITabBarItem(title: "CYAN", image: UIImage(systemName: "1.lane"), tag: 0)
    view.parentRequestable = self
    self.childRequestables.append(view)
    return view
  }()

  private lazy var magentaVC: UIViewController = {
    let view = CommonColorViewController(color: .magenta)
    view.tabBarItem = UITabBarItem(title: "MAGENTA", image: UIImage(systemName: "2.lane"), tag: 1)
    view.parentRequestable = self
    self.childRequestables.append(view)
    return view
  }()

  private lazy var yellowVC: UIViewController = {
    let view = CommonColorViewController(color: .yellow)
    view.tabBarItem = UITabBarItem(title: "YELLOW", image: UIImage(systemName: "3.lane"), tag: 0)
    view.parentRequestable = self
    self.childRequestables.append(view)
    return view
  }()

  private lazy var keyVC: UIViewController = {
    let view = CommonColorViewController(color: .key)
    view.tabBarItem = UITabBarItem(title: "KEY", image: UIImage(systemName: "4.lane"), tag: 0)
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
        HiddenNavigationController(rootViewController: self.cyanVC),
        HiddenNavigationController(rootViewController: self.magentaVC),
        HiddenNavigationController(rootViewController: self.yellowVC),
        HiddenNavigationController(rootViewController: self.keyVC)
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
