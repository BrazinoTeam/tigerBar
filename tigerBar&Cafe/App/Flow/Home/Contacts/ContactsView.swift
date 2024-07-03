//
//  ContactsView.swift

import Foundation
import UIKit
import SnapKit

class ContactsView: UIView, UITextFieldDelegate {
    
    
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
    
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private(set) var imgContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContainer
        return imageView
    }()
    
    private(set) var imgCall: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgCall
        return imageView
    }()
    
    private(set) var callLabel: UILabel = {
        let label = UILabel.createLabel(withText: "+7891237984", font: .customFont(font: .archivo, style: .thin, size: 14), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.1)
        return label
    }()
    
    private(set) var imgMessage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgMessage
        return imageView
    }()
    
    private(set) var messageLabel: UILabel = {
        let label = UILabel.createLabel(withText: "Contacts", font: .customFont(font: .archivo, style: .thin, size: 14), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.1)
        return label
    }()
    
    private(set) var imgContainerName: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContainerSend
        return imageView
    }()
    
    private(set) lazy var nameTextField: UITextField = {
        let textField = UITextField()
        let font = UIFont.customFont(font: .archivo, style: .thin, size: 14)
        let fontSize = CGFloat(16)
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white.withAlphaComponent(0.5),
        ]
        
        let placeholderText = NSAttributedString(string: "You Name", attributes: placeholderAttributes)
        textField.attributedPlaceholder = placeholderText

       
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
        ]
        textField.font = .customFont(font: .archivo, style: .thin, size: 14)
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.textAlignment = .left
        textField.delegate = self
        textField.isUserInteractionEnabled = true
        textField.returnKeyType = .done
        return textField
    }()
    
    private(set) var imgContainerEmail: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContainerSend
        return imageView
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        let placeholderText = NSAttributedString(string: "You Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        
        textField.attributedPlaceholder = placeholderText
     
        textField.font = UIFont.customFont(font: .archivo, style: .thin, size: 14)
        textField.textColor = .white
        textField.textAlignment = .left
        textField.delegate = self
        textField.returnKeyType = .done
        textField.resignFirstResponder()
        return textField
    }()
    
    private(set) var imgContainerMessage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgContainerMes
        return imageView
    }()
    
    private(set) lazy var messageTextView: UITextView = {
        let textView = UITextView()
        let font = UIFont.customFont(font: .archivo, style: .thin, size: 14)
        
        textView.font = font
        textView.textColor = .white
        textView.backgroundColor = .clear
        textView.textAlignment = .left
        textView.delegate = self
        textView.returnKeyType = .done
        textView.isScrollEnabled = false
        textView.layer.cornerRadius = 8.0
        textView.resignFirstResponder()

        textView.text = "Message"
        textView.textColor = UIColor.white.withAlphaComponent(0.5)
        
        return textView
    }()

    private (set) var sendBtn: UIButton = {
        let btn = UIButton()
        btn.configureButton(withTitle: "Send", font: .customFont(font: .aclonica, style: .regular, size: 28), titleColor: .cDarkRed, normalImage: .btnActiv, highlightedImage: .btnActivTapped)
        btn.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowRadius = 8
        btn.layer.shadowOffset = CGSize(width: 0, height: 8)
        return btn
    }()
    
    private(set) var imgPoint: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .imgPoint
        return imageView
    }()
    
    private(set) var pointLabel: UILabel = {
        let label = UILabel.createLabel(withText: "2794 Boulder Dr, June Lake, CA 93529", font: .customFont(font: .archivo, style: .thin, size: 14), textColor: .white, paragraphSpacing: 1, lineHeightMultiple: 1.1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
        setupKeyboardNotifications()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {

        [bgImage, btnBack, titleLabel, scrollView, nameTextField, emailTextField, messageTextView] .forEach(addSubview(_:))
        scrollView.addSubview(imgCenter)

        scrollView.addSubview(btnFacebook)
        scrollView.addSubview(btnInsta)

        scrollView.addSubview(imgContainer)
        imgContainer.addSubview(imgCall)
        imgContainer.addSubview(callLabel)
        imgContainer.addSubview(imgMessage)
        imgContainer.addSubview(messageLabel)
        imgContainer.addSubview(imgContainerName)
        imgContainer.addSubview(imgContainerEmail)
        imgContainer.addSubview(imgContainerMessage)

        imgContainer.addSubview(sendBtn)
        imgContainer.addSubview(imgPoint)
        imgContainer.addSubview(pointLabel)
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
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(btnBack.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(16)
        }
        
        imgCenter.snp.makeConstraints { make in
            make.top.equalToSuperview()
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
        
        imgContainer.snp.makeConstraints { make in
            make.top.equalTo(btnInsta.snp.bottom).offset(32)
            make.left.right.bottom.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
            make.height.equalTo(524)
        }
        
        imgCall.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
        
        callLabel.snp.makeConstraints { make in
            make.top.equalTo(imgCall.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        imgMessage.snp.makeConstraints { make in
            make.top.equalTo(callLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(imgMessage.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        imgContainerName.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.left.right.equalTo(imgContainerName).inset(8)
            make.centerY.equalTo(imgContainerName)
            make.height.equalTo(18)
        }
        
        imgContainerEmail.snp.makeConstraints { make in
            make.top.equalTo(imgContainerName.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { make in
            make.left.right.equalTo(imgContainerEmail).inset(8)
            make.centerY.equalTo(imgContainerEmail)
            make.height.equalTo(18)
        }
        
        imgContainerMessage.snp.makeConstraints { make in
            make.top.equalTo(imgContainerEmail.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
        
        messageTextView.snp.makeConstraints { make in
            make.left.right.equalTo(imgContainerMessage).inset(8)
            make.width.equalTo(280)
            make.top.equalTo(imgContainerMessage.snp.top).offset(8)
            make.height.greaterThanOrEqualTo(40) // Минимальная высота для многострочного текста
        }

        
        sendBtn.snp.makeConstraints { make in
            make.top.equalTo(imgContainerMessage.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(56)
            make.width.equalTo(300)
        }
        
        imgPoint.snp.makeConstraints { make in
            make.top.equalTo(sendBtn.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
        }
        
        pointLabel.snp.makeConstraints { make in
            make.top.equalTo(imgPoint.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupKeyboardNotifications() {
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
       
       @objc private func keyboardWillShow(notification: NSNotification) {
           if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
               let keyboardHeight = keyboardFrame.cgRectValue.height
               scrollView.contentInset.bottom = keyboardHeight
               scrollView.scrollIndicatorInsets.bottom = keyboardHeight
           }
       }
       
       @objc private func keyboardWillHide(notification: NSNotification) {
           scrollView.contentInset.bottom = 0
           scrollView.scrollIndicatorInsets.bottom = 0
       }

       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder() // Закрытие клавиатуры
           return true
       }
   }

extension ContactsView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.white.withAlphaComponent(0.5) {
            textView.text = nil
            textView.textColor = .white
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Message"
            textView.textColor = UIColor.white.withAlphaComponent(0.5)
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        // Dynamically adjust the height of the text view
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder() // Закрытие клавиатуры
            return false // Предотвращение добавления новой строки
        }
        return true
    }
}
