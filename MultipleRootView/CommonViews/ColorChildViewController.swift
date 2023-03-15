//
//  ColorChildViewController.swift
//  MultipleRootView
//
//  Created by 구본욱 on 2023/03/15.
//

import UIKit

final class ColorChildViewController: UIViewController, RootNaviRequestable {

  weak var parentRequestable: RootNaviRequestable?
  var childRequestables: [RootNaviRequestable] = []
  var viewTitle: String?

  init(viewTitle: String) {
    self.viewTitle = viewTitle
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
    printDetail(message: self.viewTitle ?? "")

    let label = UILabel()
    label.font = .preferredFont(forTextStyle: .headline)
    label.text = self.viewTitle
    label.textColor = .label
    label.translatesAutoresizingMaskIntoConstraints = false

    let button = UIButton()
    button.setTitle("스위치 위치 변경하기", for: .normal)
    button.setTitleColor(.secondaryLabel, for: .normal)
    button.addTarget(self, action: #selector(self.requestSwitchRootNaviPosition), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false

    self.view.addSubview(label)
    self.view.addSubview(button)

    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
      label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
      button.widthAnchor.constraint(equalToConstant: 240),
      button.heightAnchor.constraint(equalToConstant: 45),
      button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
      button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
    ])
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    printDetail(message: self.viewTitle ?? "")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    printDetail(message: self.viewTitle ?? "")
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    printDetail(message: self.viewTitle ?? "")
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    printDetail(message: self.viewTitle ?? "")
  }

  @objc private func requestSwitchRootNaviPosition() {
    let result = self.requestSwitchNaviButtonLocation()
    printDetail(message: "requestSwitchRootNaviPositionResult \(result)")
  }
}
