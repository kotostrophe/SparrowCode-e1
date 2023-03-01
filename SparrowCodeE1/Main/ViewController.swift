//
//  ViewController.swift
//  SparrowCodeE1
//
//  Created by Коцур Тарас Сергійович on 01.03.2023.
//

import UIKit

final class ViewController: UIViewController {
  
  // MARK: - UI Properties
  
  private lazy var rectangleView: GradientView = .init(frame: .zero)
  
  // MARK: - Initializers
  
  init() {
    super.init(nibName: nil, bundle: nil)
    
    configureView()
    configureLayout()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configuration methods
  
  private func configureView() {
    view.backgroundColor = .white
  }
  
  private func configureLayout() {
    view.addSubview(rectangleView)
    rectangleView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      rectangleView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      rectangleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Appearance.leadingOffset),
      rectangleView.widthAnchor.constraint(equalToConstant: Appearance.Rectangle.width),
      rectangleView.heightAnchor.constraint(equalTo: rectangleView.widthAnchor, multiplier: Appearance.Rectangle.aspectRatio)
    ])
  }
}

extension ViewController {
  
  private enum Appearance {
    static let leadingOffset: CGFloat = 100
    
    enum Rectangle {
      static let width: CGFloat = 128
      static let aspectRatio: CGFloat = 1
    }
  }
}
