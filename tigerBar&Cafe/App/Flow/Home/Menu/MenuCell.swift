import Foundation
import UIKit
import SnapKit

class MenuCell: UITableViewCell {
    
    static let reuseId = String(describing: MenuCell.self)

    private(set) lazy var backImg: UIImageView = {
        let iv = UIImageView()
        iv.image = .imgContMenu
        return iv
    }()
    
    private(set) lazy var imgSelection: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 16
        iv.clipsToBounds = true
        return iv
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(font: .aclonica, style: .regular, size: 14)
        label.textColor = .cYellow
        return label
    }()
    
    private(set) lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(font: .inter, style: .regular, size: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    private(set) lazy var imgCoints: UIImageView = {
        let iv = UIImageView()
        iv.image  = .imgCoints
        return iv
    }()
    
    private(set) lazy var cointsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.customFont(font: .archivo, style: .bold, size: 16)
        label.textColor = .cYellow
        return label
    }()
    
    private(set) lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 20
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 12
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imgSelection.image = nil
        titleLabel.text = nil
        subTitleLabel.text = nil
        cointsLabel.text = nil
    }
    
    func configure(with menuItem: MenuItem) {
        imgSelection.image = UIImage(named: menuItem.imageName)
        titleLabel.text = menuItem.title
        subTitleLabel.text = menuItem.subtitle
        cointsLabel.text = menuItem.coints
        setUpConstraints()
    }
    
    func configureForDrinks(with menuDrink: MenuDrinks) {
        titleLabel.text = menuDrink.title
        subTitleLabel.text = menuDrink.subtitle
        cointsLabel.text = menuDrink.coints
        setUpConstDrinks()
    }

    private func setupUI() {
        backgroundColor = .clear
        contentView.addSubview(menuView)
        contentView.backgroundColor = .clear
        selectionStyle = .none
        [backImg, imgSelection, titleLabel, subTitleLabel, imgCoints, cointsLabel].forEach(menuView.addSubview(_:))
    }
    
    private func setUpConstraints(){
        menuView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(96)
            make.width.equalTo(360)
        }

        backImg.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        imgSelection.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(8)
            make.width.equalTo(78)
            make.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imgSelection.snp.top)
            make.left.equalTo(imgSelection.snp.right).offset(4)
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalTo(imgSelection.snp.right).offset(4)
            make.width.equalTo(148)
        }
        
        imgCoints.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-8)
            make.size.equalTo(20)
        }
        
        cointsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imgCoints.snp.bottom)
            make.right.equalToSuperview().offset(-8)
        }
    }

    private func setUpConstDrinks() {
        menuView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(76)
            make.width.equalTo(360)
        }
        
        backImg.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(8)
        }
        
        subTitleLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(8)
            make.width.equalTo(232)
        }
        
        imgCoints.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview().offset(-12)
            make.right.equalToSuperview().offset(-8)
            make.size.equalTo(20)
        }
        
        cointsLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(imgCoints.snp.bottom)
            make.right.equalToSuperview().offset(-8)
        }
    }
}
