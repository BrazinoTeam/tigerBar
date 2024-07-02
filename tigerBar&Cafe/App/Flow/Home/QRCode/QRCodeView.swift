//
//  QRCodeView.swift

import Foundation
import UIKit
import SnapKit

class QRCodeView: UIView {
    
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgOther
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private(set) var btnBack: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnBack, for: .normal)
        btn.setBackgroundImage(.btnBackTapped, for: .highlighted)
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    private(set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "QR code", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private(set) var imgCenter: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgTigerCenter
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) lazy var bonusCardQRConteinerView: GradientView = {
        let view = GradientView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private(set) lazy var qrCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private(set) var subTitleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Show your QR-code when buying\nand get a 15% discount", font: .customFont(font: .archivo, style: .regular, size: 20), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.29)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
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

        [bgImage, btnBack, titleLabel, imgCenter, bonusCardQRConteinerView, subTitleLabel] .forEach(addSubview(_:))
        bonusCardQRConteinerView.addSubview(qrCodeImageView)

    }
    
    private func setupConstraints() {
        
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btnBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48)
            make.left.equalToSuperview().offset(16)
            make.size.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(btnBack).offset(4)
        }
        
        imgCenter.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(btnBack.snp.bottom).offset(56)
            make.width.equalTo(300)
            make.height.equalTo(222)
        }
        
        bonusCardQRConteinerView.snp.makeConstraints { make in
            make.top.equalTo(imgCenter.snp.bottom).offset(-8)
            make.centerX.equalToSuperview()
            make.size.equalTo(300)
        }
        
        qrCodeImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(3)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(bonusCardQRConteinerView.snp.bottom).offset(56)
            make.centerX.equalToSuperview()
        }
    }
}
