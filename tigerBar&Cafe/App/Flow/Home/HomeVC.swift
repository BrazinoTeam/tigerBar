//
//  HomeVC.swift

import Foundation
import UIKit
import CoreImage

class HomeVC: UIViewController {
    
    
    private var contentView: HomeView {
        view as? HomeView ?? HomeView()
    }
    
    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tappedButtons()
    }

    private func tappedButtons() {
        contentView.btnProfile.addTarget(self, action: #selector(goProfile), for: .touchUpInside)
        contentView.menuBtn.addTarget(self, action: #selector(goMenu), for: .touchUpInside)
        contentView.qrBtn.addTarget(self, action: #selector(goQRCode), for: .touchUpInside)
        contentView.contactBtn.addTarget(self, action: #selector(goContacts), for: .touchUpInside)
        contentView.aboutBtn.addTarget(self, action: #selector(goAboutUs), for: .touchUpInside)
    }
    
    
    @objc func goProfile() {
        let vc = ProfileVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goMenu() {
        let vc = MenuVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goQRCode() {
        let vc = QRCodeVC()
        navigationController?.pushViewController(vc, animated: true)
        let qrCodeString = UUID().uuidString
        if let qrCodeImage = generateQRCode(from: qrCodeString, size: CGSize(width: 260, height: 260)) {
            vc.contentView.qrCodeImageView.image = qrCodeImage
        }
    }
    
    @objc func goContacts() {
        let vc = ContactsVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goAboutUs() {
        let vc = AboutUsVC()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func generateQRCode(from string: String, size: CGSize) -> UIImage? {
        if let data = string.data(using: .utf8), let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
            qrFilter.setValue(data, forKey: "inputMessage")

            if let qrImage = qrFilter.outputImage {
                let extent = qrImage.extent
                let scaleX = size.width / extent.size.width
                let scaleY = size.height / extent.size.height
                let transformedImage = qrImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))

                let filter = CIFilter(name: "CIFalseColor")
                filter?.setValue(transformedImage, forKey: kCIInputImageKey)
                filter?.setValue(CIColor(hex: "#320003"), forKey: "inputColor0") // Цвет фона
                filter?.setValue(CIColor.white, forKey: "inputColor1") // Цвет QR-кода

                if let outputImage = filter?.outputImage,
                   let cgImage = CIContext().createCGImage(outputImage, from: outputImage.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }
        }

        return nil
    }
    
//    private func generateQRCode(from string: String, size: CGSize) -> UIImage? {
//        if let data = string.data(using: .utf8), let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
//            qrFilter.setValue(data, forKey: "inputMessage")
//
//            if let qrImage = qrFilter.outputImage {
//                let extent = qrImage.extent
//                let scaleX = size.width / extent.size.width
//                let scaleY = size.height / extent.size.height
//                let transformedImage = qrImage.transformed(by: CGAffineTransform(scaleX: scaleX, y: scaleY))
//
//                let filter = CIFilter(name: "CIFalseColor")
//                filter?.setValue(transformedImage, forKey: kCIInputImageKey)
//                filter?.setValue(CIColor(red: 50, green: 0, blue: 1), forKey: "inputColor0") // Цвет фона
//                filter?.setValue(CIColor.white, forKey: "inputColor1") //  Цвет QR-кода
//
//                if let outputImage = filter?.outputImage,
//                   let cgImage = CIContext().createCGImage(outputImage, from: outputImage.extent) {
//                    return UIImage(cgImage: cgImage)
//                }
//            }
//        }
//
//        return nil
//    }
}

extension CIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: .whitespacesAndNewlines))
        scanner.currentIndex = hex.startIndex

        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }

        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
