//
//  GradientView.swift
//  SparrowCodeE1
//
//  Created by Коцур Тарас Сергійович on 01.03.2023.
//

import UIKit

final class GradientView: UIView {
  
  // MARK: - UI Properties
  
  private lazy var shadowLayer: CAShapeLayer = {
    let shapeLayer = CAShapeLayer()
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.shadowColor = Appearance.Shadow.color.cgColor
    shapeLayer.shadowOffset = Appearance.Shadow.offset
    shapeLayer.shadowOpacity = Appearance.Shadow.opacity
    shapeLayer.shadowRadius = Appearance.Shadow.radius
    shapeLayer.shouldRasterize = true
    shapeLayer.rasterizationScale = UIScreen.main.scale
    return shapeLayer
  }()
  
  private lazy var gradientLayer: CALayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.cornerRadius = Appearance.cornerRadius
    gradientLayer.colors = Appearance.Gradient.colors.map(\.cgColor)
    gradientLayer.locations = (0 ..< Appearance.Gradient.colors.count).map({ index in index as NSNumber })
    gradientLayer.startPoint = Appearance.Gradient.startPoint
    gradientLayer.endPoint = Appearance.Gradient.endPoint
    return gradientLayer
  }()
  
  // MARK: - Initializers
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configureView()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle methods
  
  override func layoutSubviews() {
    super.layoutSubviews()
  
    resetShadowLayerPath()
    resetGradientLayerPath()
  }
  
  // MARK: - Configuration methods
  
  private func configureView() {
    layer.cornerRadius = Appearance.cornerRadius
    layer.addSublayer(shadowLayer)
    layer.addSublayer(gradientLayer)
  }
  
  private func resetShadowLayerPath() {
    let bezierPath = UIBezierPath(roundedRect: bounds, cornerRadius: Appearance.Shadow.radius)
    shadowLayer.path = bezierPath.cgPath
    shadowLayer.shadowPath = bezierPath.cgPath
  }
  
  private func resetGradientLayerPath() {
    gradientLayer.frame = bounds
  }
}

extension GradientView {
  
  private enum Appearance {
    static let cornerRadius: CGFloat = 16
    
    enum Gradient {
      static let colors: [UIColor] = [.yellow, .blue]
      static let startPoint: CGPoint = .init(x: 0.0, y: 0.0)
      static let endPoint: CGPoint = .init(x: 0.0, y: 1.0)
    }
    
    enum Shadow {
      static let color: UIColor = .black
      static let opacity: Float = 0.5
      static let radius: CGFloat = 16
      static let offset: CGSize = .init(width: 0, height: 8)
    }
  }
}
