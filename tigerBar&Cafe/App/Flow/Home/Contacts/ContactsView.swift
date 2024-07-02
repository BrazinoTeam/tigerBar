//
//  ContactsView.swift

import Foundation
import UIKit
import SnapKit

class ContactsView: UIView {
    
    
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
        let label = UILabel.createLabel(withText: "Contacts", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private(set) var imgCenter: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgTigerCenter
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private(set) var btnFacebook: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnFacebook, for: .normal)
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    private(set) var btnInsta: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.btnInstagram, for: .normal)
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private(set) var imgContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContainer
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

        [bgImage, btnBack, titleLabel, imgCenter, btnFacebook, btnInsta, scrollView] .forEach(addSubview(_:))
        scrollView.addSubview(imgContainer)

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
        
        btnFacebook.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-52)
            make.top.equalTo(imgCenter.snp.bottom).offset(24)
        }
        
        btnInsta.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(52)
            make.top.equalTo(imgCenter.snp.bottom).offset(24)
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(btnInsta.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(16)
        }
        
        imgContainer.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
            make.height.equalTo(524)
        }
    }
}

