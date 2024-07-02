//
//  GradientView.swift

import Foundation
import UIKit

class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
 

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
       
        let gradientBorder = getGradientLayerYellowGreen(bounds: bounds)
        layer.borderColor = gradientColor(bounds: bounds, gradientLayer: gradientBorder)?.cgColor
        layer.borderWidth = 1
    }
    
    private func setupGradient() {
        layer.addSublayer(gradientLayer)
        gradientLayer.cornerRadius = 16
        gradientLayer.colors = [UIColor.cGradient.cgColor, UIColor.cYellow.cgColor, UIColor.cGradient.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        
    }
}
