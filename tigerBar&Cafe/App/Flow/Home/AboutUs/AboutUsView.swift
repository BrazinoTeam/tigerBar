//
//  AboutUsView.swift

import Foundation
import UIKit
import SnapKit

class AboutUsView: UIView {
    
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgOther
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private (set) var btnBack: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnBack, for: .normal)
        btn.setBackgroundImage(.btnBackTapped, for: .highlighted)
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    private (set) var titleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "About Us", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
   
    private (set) var imgCenter: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgTigerCenter
        imageView.contentMode = .scaleAspectFit
        return imageView
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

        [bgImage, btnBack, titleLabel, imgCenter] .forEach(addSubview(_:))

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
            make.top.equalTo(btnBack.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.height.equalTo(266)
        }
    }
}
