//
//  Extesion Gradient.swift
//  tigerBar&Cafe


import Foundation
import UIKit

extension UIView {
    

        
    func getGradientLayerYellowGreen(bounds : CGRect) -> CAGradientLayer{
            let gradient = CAGradientLayer()
        let orangeOne = UIColor.cGradient
        let yellowTwo = UIColor.orange
            gradient.frame = bounds
            //order of gradient colors
            gradient.colors = [orangeOne.cgColor , yellowTwo.cgColor, orangeOne]
            // start and end points
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            return gradient
        }
        
        func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
            UIGraphicsBeginImageContext(gradientLayer.bounds.size)
            //create UIImage by rendering gradient layer.
            gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            //get gradient UIcolor from gradient UIImage
            return UIColor(patternImage: image!)
        }
}

extension UIImage {
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        // This makes it left to right, default is top to bottom
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        let renderer = UIGraphicsImageRenderer(bounds: bounds)

        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}
