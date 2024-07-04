//
//  ProfileViewScreen.swift

import Foundation
import UIKit
import SnapKit

class ProfileViewScreen: UIView , UITextFieldDelegate{
    
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgOther
        imageView.contentMode = .scaleToFill
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
        let label = UILabel.createLabel(withText: "Profile", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private(set) var userPhoto: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(.imgUserDef, for: .normal)
        btn.layer.cornerRadius = 52
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        btn.clipsToBounds = true
        return btn
    }()
    
    private (set) var imgContText: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContTextName
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private(set) lazy var profileTextField: UITextField = {
        let textField = UITextField()
        let font = UIFont.customFont(font: .aclonica, style: .regular, size: 22)
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white
        ]
        
        let placeholderText = NSAttributedString(string: "\(UserMemory.shared.userName ?? "User Name")", attributes: placeholderAttributes)
        textField.attributedPlaceholder = placeholderText
        
         let savedUserName = UserMemory.shared.userID
        textField.placeholder = "user#\(savedUserName)"
        
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
        ]
        textField.font = UIFont.customFont(font: .aclonica, style: .regular, size: 22)
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.textAlignment = .center
        textField.delegate = self
        textField.returnKeyType = .done
        return textField
    }()
    
    private(set) var btnChangeName: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Change Name", font: .customFont(font: .aclonica, style: .regular, size: 22), titleColor: .cDarkRed, normalImage: .btnActiv, highlightedImage: .btnActivTapped)
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    private(set) var subTitleLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Scan your QR code in the mobile app to keep your\nstatistics up-to-date effortlessly", font: .customFont(font: .archivo, style: .bold, size: 14), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.1)
        return label
    }()
    
    private(set) var analyticsLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Analytics", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private (set) var imgMoneyCont: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContAnalytics
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOffset = CGSize(width: 0, height: 8)
        return imageView
    }()
    
    private(set) var titleMoneyLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Total Money Spent", font: .customFont(font: .aclonica, style: .regular, size: 11), textColor: .cOrange, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private(set) var subTitleMoneyLabel: UILabel = {
        let label = UILabel.createLabel(withText: "View the total amount of\nmoney you have spent\nat Tiger Bar and Cafe", font: .customFont(font: .archivo, style: .thin, size: 11), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private (set) var imgMoneyCoint: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgCoints
        return imageView
    }()
    
    private(set) var cointsMoneyLabel: UILabel = {
        let label = UILabel.createLabel(withText: "0 ₫", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private (set) var imgDrinkCont: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContAnalytics
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOffset = CGSize(width: 0, height: 8)
        return imageView
    }()
    
    private(set) var titleDrinkLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Favorite Drink", font: .customFont(font: .aclonica, style: .regular, size: 11), textColor: .cOrange, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private(set) var subTitleDrinkLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Discover which drink you\norder the most frequently", font: .customFont(font: .archivo, style: .thin, size: 11), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private(set) var cointsDrinkLabel: UILabel = {
        let label = UILabel.createLabel(withText: "", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private (set) var imgVisitCont: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContAnalytics
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOffset = CGSize(width: 0, height: 8)
        return imageView
    }()
    
    private(set) var titleVisitLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Total Visits", font: .customFont(font: .aclonica, style: .regular, size: 11), textColor: .cOrange, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private(set) var subTitleVisitLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Track the total number\nof times you've\nvisited the cafe", font: .customFont(font: .archivo, style: .thin, size: 11), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private(set) var cointsVisitLabel: UILabel = {
        let label = UILabel.createLabel(withText: "0", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private (set) var imgOrderCont: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContAnalytics
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOffset = CGSize(width: 0, height: 8)
        return imageView
    }()
    
    private(set) var titleOrderLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Average Order Value", font: .customFont(font: .aclonica, style: .regular, size: 11), textColor: .cOrange, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private(set) var subTitleOrderLabel: UILabel = {
        let label = UILabel.createLabel(withText: "See the average amount\nyou spend per order", font: .customFont(font: .archivo, style: .thin, size: 11), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private (set) var imgOrderCoint: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgCoints
        return imageView
    }()
    
    private(set) var cointsOrderLabel: UILabel = {
        let label = UILabel.createLabel(withText: "0 ₫", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private (set) var imgTotalCont: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContTotal
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 8
        imageView.layer.shadowOffset = CGSize(width: 0, height: 8)
        return imageView
    }()
    
    private(set) var titleTotalLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Total Items Ordered", font: .customFont(font: .aclonica, style: .regular, size: 11), textColor: .cOrange, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private(set) var subTitleTotalLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Count the total number of items you have ordered", font: .customFont(font: .archivo, style: .thin, size: 11), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private(set) var cointsTotalLabel: UILabel = {
        let label = UILabel.createLabel(withText: "0", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        saveName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {

        [bgImage, btnBack, titleLabel, userPhoto, imgContText, profileTextField, btnChangeName, subTitleLabel, analyticsLabel, imgMoneyCont, imgDrinkCont, imgVisitCont, imgOrderCont, imgTotalCont] .forEach(addSubview(_:))

        imgMoneyCont.addSubview(titleMoneyLabel)
        imgMoneyCont.addSubview(subTitleMoneyLabel)
        imgMoneyCont.addSubview(imgMoneyCoint)
        imgMoneyCont.addSubview(cointsMoneyLabel)

        imgDrinkCont.addSubview(titleDrinkLabel)
        imgDrinkCont.addSubview(subTitleDrinkLabel)
        imgDrinkCont.addSubview(cointsDrinkLabel)
        
        imgVisitCont.addSubview(titleVisitLabel)
        imgVisitCont.addSubview(subTitleVisitLabel)
        imgVisitCont.addSubview(cointsVisitLabel)

        imgOrderCont.addSubview(titleOrderLabel)
        imgOrderCont.addSubview(subTitleOrderLabel)
        imgOrderCont.addSubview(imgOrderCoint)
        imgOrderCont.addSubview(cointsOrderLabel)
        
        imgTotalCont.addSubview(titleTotalLabel)
        imgTotalCont.addSubview(subTitleTotalLabel)
        imgTotalCont.addSubview(cointsTotalLabel)

    }
    
    private func setupConstraints() {
        
        bgImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btnBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48.autoSize)
            make.left.equalToSuperview().offset(16)
            make.size.equalTo(48)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(btnBack).offset(6)
            make.height.equalTo(30)
        }
        
        userPhoto.snp.makeConstraints { make in
            make.top.equalTo(btnBack.snp.bottom).offset(32.autoSize)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(112)
            make.height.equalTo(124)
        }
        
        imgContText.snp.makeConstraints { make in
            make.top.equalTo(btnBack.snp.bottom).offset(48)
            make.right.equalToSuperview().offset(-16)
            make.width.equalTo(240.autoSize)
            make.height.equalTo(48.autoSize)
        }
        
        profileTextField.snp.makeConstraints { make in
            make.centerY.equalTo(imgContText)
            make.left.right.equalTo(imgContText).inset(8)
        }
        
        btnChangeName.snp.makeConstraints { make in
            make.centerX.equalTo(imgContText)
            make.top.equalTo(imgContText.snp.bottom).offset(8)
            make.width.equalTo(240.autoSize)
            make.height.equalTo(56.autoSize)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(btnChangeName.snp.bottom).offset(24.autoSize)
            make.centerX.equalToSuperview()
        }
        
        analyticsLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(24.autoSize)
            make.centerX.equalToSuperview()
        }
        
        imgMoneyCont.snp.makeConstraints { make in
            make.top.equalTo(analyticsLabel.snp.bottom).offset(16.autoSize)
            make.centerX.equalToSuperview().offset(-91.autoSize)
            make.width.equalTo(160.autoSize)
            make.height.equalTo(146.autoSize)
        }
        
        titleMoneyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
        }
        
        subTitleMoneyLabel.snp.makeConstraints { make in
            make.top.equalTo(titleMoneyLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        cointsMoneyLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-4)
            make.centerX.equalToSuperview().offset(8)
        }
        
        imgMoneyCoint.snp.makeConstraints { make in
            make.right.equalTo(cointsMoneyLabel.snp.left).offset(-4.autoSize)
            make.centerY.equalTo(cointsMoneyLabel).offset(-4.autoSize)
        }
        
        imgDrinkCont.snp.makeConstraints { make in
            make.top.equalTo(analyticsLabel.snp.bottom).offset(16.autoSize)
            make.centerX.equalToSuperview().offset(91.autoSize)
            make.width.equalTo(160.autoSize)
            make.height.equalTo(146.autoSize)
        }
        
        titleDrinkLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
        }
        
        subTitleDrinkLabel.snp.makeConstraints { make in
            make.top.equalTo(titleDrinkLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        cointsDrinkLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleDrinkLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview().offset(8)
        }
     
        imgVisitCont.snp.makeConstraints { make in
            make.top.equalTo(imgMoneyCont.snp.bottom).offset(8.autoSize)
            make.centerX.equalToSuperview().offset(-91.autoSize)
            make.width.equalTo(160.autoSize)
            make.height.equalTo(146.autoSize)
        }
        
        titleVisitLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.centerX.equalToSuperview()
        }
        
        subTitleVisitLabel.snp.makeConstraints { make in
            make.top.equalTo(titleVisitLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        cointsVisitLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-4)
            make.centerX.equalToSuperview()
        }
        
        imgOrderCont.snp.makeConstraints { make in
            make.top.equalTo(imgDrinkCont.snp.bottom).offset(8.autoSize)
            make.centerX.equalToSuperview().offset(91.autoSize)
            make.width.equalTo(160.autoSize)
            make.height.equalTo(146.autoSize)
        }
        
        titleOrderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.right.equalToSuperview().inset(8)
        }
        
        subTitleOrderLabel.snp.makeConstraints { make in
            make.top.equalTo(titleOrderLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        cointsOrderLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-4)
            make.centerX.equalToSuperview().offset(8)
        }
        
        imgOrderCoint.snp.makeConstraints { make in
            make.right.equalTo(cointsOrderLabel.snp.left).offset(-4)
            make.centerY.equalTo(cointsOrderLabel).offset(-4)
        }
        
        imgTotalCont.snp.makeConstraints { make in
            make.top.equalTo(imgOrderCont.snp.bottom).offset(8.autoSize)
            make.centerX.equalToSuperview()
            make.width.equalTo(280.autoSize)
            make.height.equalTo(100.autoSize)
        }
        
        titleTotalLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.centerX.equalToSuperview()
        }
        
        subTitleTotalLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTotalLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        cointsTotalLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-4)
            make.centerX.equalToSuperview()
        }
    }
    
    private func saveName() {
        if let savedUserName = UserMemory.shared.userName {
            profileTextField.text = savedUserName
        }
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        UserMemory.shared.userName = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Закрытие клавиатуры
        return true
    }
}
