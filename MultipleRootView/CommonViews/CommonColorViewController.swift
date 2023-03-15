//
//  CommonColorViewController.swift
//  MultipleRootView
//
//  Created by 구본욱 on 2023/03/15.
//

import UIKit

final class CommonColorViewController: UIViewController, RootNaviRequestable {

  weak var parentRequestable: RootNaviRequestable?
  var childRequestables: [RootNaviRequestable] = []

  private let color: CommonColor?

  init(color: CommonColor) {
    self.color = color
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  deinit {
    guard let childs = self.parentRequestable?.childRequestables, let meIndex = childs.firstIndex(where: { $0 === self }) else {
      return
    }
    self.parentRequestable?.childRequestables.remove(at: meIndex)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    printDetail(message: self.color?.rawValue.uppercased() ?? "")

    let action = UIAction(title: self.title ?? "Unknown") { action in
      printDetail(message: "RequestSomething from: \(self.color?.rawValue ?? "")")
    }
    let barButton = UIBarButtonItem(title: self.title, primaryAction: action)
    self.navigationItem.setRightBarButton(barButton, animated: false)
    self.view.backgroundColor = self.color?.uiColor.withAlphaComponent(0.5)

    let button = UIButton(type: .custom)
    button.setTitle("다음 화면으로", for: .normal)
    button.setTitleColor(.label, for: .normal)
    button.addTarget(self, action: #selector(self.pushButtonDidTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(button)
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      button.widthAnchor.constraint(equalToConstant: 180),
      button.heightAnchor.constraint(equalToConstant: 45)
    ])
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    printDetail(message: self.color?.rawValue.uppercased() ?? "")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    printDetail(message: self.color?.rawValue.uppercased() ?? "")
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    printDetail(message: self.color?.rawValue.uppercased() ?? "")
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    printDetail(message: self.color?.rawValue.uppercased() ?? "")
  }

  @objc private func pushButtonDidTapped() {
    let vc = ColorChildViewController(viewTitle: self.color?.rawValue.uppercased() ?? "UnknownColor")
    vc.view.backgroundColor = self.color?.uiColor
    vc.parentRequestable = self
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
