//
//  HomeView.swift

import Foundation
import UIKit
import SnapKit

class HomeView: UIView {
    
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgHome
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private (set) var imgLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgLogoHome
        return imageView
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Home", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private (set) var btnProfile: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnProfile, for: .normal)
        btn.setBackgroundImage(.btnProfileTapped, for: .highlighted)
        return btn
    }()
    
    private (set) var menuBtn: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Menu", font: .customFont(font: .aclonica, style: .regular, size: 28), titleColor: .cDarkRed, normalImage: .btnActiv, highlightedImage: .btnActivTapped)
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()

    private (set) var qrBtn: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "QR Code", font: .customFont(font: .aclonica, style: .regular, size: 28), titleColor: .cDarkRed, normalImage: .btnActiv, highlightedImage: .btnActivTapped)
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    private (set) var contactBtn: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Contacts", font: .customFont(font: .aclonica, style: .regular, size: 28), titleColor: .cDarkRed, normalImage: .btnActiv, highlightedImage: .btnActivTapped)
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    private (set) var aboutBtn: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "About Us", font: .customFont(font: .aclonica, style: .regular, size: 28), titleColor: .cDarkRed, normalImage: .btnActiv, highlightedImage: .btnActivTapped)
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
   
    private(set) var buttonStack: UIStackView = {
           let stackView = UIStackView()
           stackView.axis = .vertical
           stackView.alignment = .center
           stackView.spacing = 20
           return stackView
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        [bgImage, imgLogo, titleLabel, btnProfile, buttonStack] .forEach(addSubview(_:))
        [menuBtn, qrBtn, contactBtn, aboutBtn].forEach(buttonStack.addArrangedSubview(_:))

    }
    
    private func setupConstraints() {
     
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        imgLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48)
            make.left.equalToSuperview().offset(16)
            make.size.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(imgLogo).offset(4)
        }
        
        btnProfile.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48)
            make.right.equalToSuperview().offset(-16)
            make.size.equalTo(48)
        }
        
        buttonStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(170)
        }
    }
}
