//
//  MenuView.swift

import Foundation
import UIKit
import SnapKit

class MenuView: UIView {
    
    
    private (set) var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .bgMenu
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
        let label = UILabel.createLabel(withText: "Menu", font: .customFont(font: .aclonica, style: .regular, size: 22), textColor: .cYellow, paragraphSpacing: 1, lineHeightMultiple: 0.88)
        return label
    }()
    
    private (set) var btnView: UIView = {
        let view = UIImageView()
        view.backgroundColor = .cRedMiddle
        return view
    }()
    
    private(set) var buttonStack: UIStackView = {
           let stackView = UIStackView()
           stackView.axis = .horizontal
           stackView.alignment = .center
           stackView.spacing = 20
           return stackView
       }()
    
    private(set) var btnAppetizers: UIButton = {
        let btn = UIButton()
        btn.setTitle("Appetizers".uppercased(), for: .normal)
        btn.titleLabel?.font = UIFont.customFont(font: .archivo, style: .thin, size: 16)
        return btn
    }()
    
    private(set) var btnMainCourses: UIButton = {
        let btn = UIButton()
        btn.setTitle("MainCourses", for: .normal)
        btn.titleLabel?.font = UIFont.customFont(font: .archivo, style: .thin, size: 16)
        return btn
    }()
    
    private(set) var btnDrinks: UIButton = {
        let btn = UIButton()
        btn.setTitle("Drinks", for: .normal)
        btn.titleLabel?.font = UIFont.customFont(font: .archivo, style: .thin, size: 16)
        return btn
    }()
    
    private(set) lazy var tableViewAppetizers: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.reuseId)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private(set) lazy var tableViewMainCourses: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.reuseId)
        tableView.separatorStyle = .none
        tableView.isHidden = true
        return tableView
    }()
    
    private(set) lazy var tableViewDrinks: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.reuseId)
        tableView.separatorStyle = .none
        tableView.isHidden = true
        return tableView
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

        [bgImage, btnBack, titleLabel, btnView, buttonStack, tableViewAppetizers, tableViewMainCourses, tableViewDrinks] .forEach(addSubview(_:))
        [btnAppetizers, btnMainCourses, btnDrinks].forEach(buttonStack.addArrangedSubview(_:))
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
        
        btnView.snp.makeConstraints { make in
            make.top.equalTo(btnBack.snp.bottom).offset(16)
            make.left.right.equalToSuperview()
            make.height.equalTo(52)
        }
        
        buttonStack.snp.makeConstraints { make in
            make.top.equalTo(btnBack.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(52)
        }
        
        btnAppetizers.snp.makeConstraints { make in
            make.width.equalTo(124)
            make.height.equalTo(52)
        }
        
        btnMainCourses.snp.makeConstraints { make in
            make.width.equalTo(118)
            make.height.equalTo(52)
        }
        
        btnDrinks.snp.makeConstraints { make in
            make.width.equalTo(64)
            make.height.equalTo(52)
        }
        
        tableViewAppetizers.snp.makeConstraints { make in
            make.top.equalTo(btnView.snp.bottom)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
        tableViewMainCourses.snp.makeConstraints { make in
            make.top.equalTo(btnView.snp.bottom)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
        tableViewDrinks.snp.makeConstraints { make in
            make.top.equalTo(btnView.snp.bottom)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
}
