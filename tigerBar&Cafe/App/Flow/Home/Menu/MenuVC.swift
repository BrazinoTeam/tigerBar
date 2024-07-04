import Foundation
import UIKit
import SnapKit

struct MenuItem {
    let imageName: String
    let title: String
    let subtitle: String
    let coints: String
}

struct MenuDrinks {
    let title: String
    let subtitle: String
    let coints: String
}

class MenuVC: UIViewController {
    
    private var fullScreenViewBonus: UIView?

    private var contentView: MenuView {
        view as? MenuView ?? MenuView()
    }
    
    private var menuItemsAppe: [MenuItem] = [
           MenuItem(imageName: "appOne", title: "Chicken Wings", subtitle: "Spicy, BBQ, or plain wings served with ranch", coints: "280,000 ₫"),
           MenuItem(imageName: "appTwo", title: "Nachos", subtitle: "Tortilla chips topped with cheese, jalapenos, and salsa", coints: "230,000 ₫"),
           MenuItem(imageName: "appThree", title: "Spring Rolls", subtitle: "Fresh vegetable and shrimp spring rolls with peanut sauce", coints: "150,000 ₫"),
           MenuItem(imageName: "appFour", title: "Garlic Bread", subtitle: "Toasted baguette slices with garlic butter", coints: "100,000 ₫")
       ]
    
    private var menuItemsMain: [MenuItem] = [
           MenuItem(imageName: "mainOne", title: "Cheeseburger", subtitle: "Juicy beef patty with cheese, lettuce, tomato, and pickles", coints: "350,000 ₫"),
           MenuItem(imageName: "mainTwo", title: "Fish and Chips", subtitle: "Crispy fried fish served with fries and tartar sauce", coints: "420,000 ₫"),
           MenuItem(imageName: "mainThree", title: "Grilled Chicken Salad", subtitle: "Mixed greens with grilled chicken, cherry tomatoes, and balsamic dressing", coints: "320,000 ₫"),
           MenuItem(imageName: "mainFour", title: "Spaghetti Bolognese", subtitle: "Classic spaghetti with a rich meat sauce and Parmesan cheese", coints: "380,000 ₫")
       ]
    
    private var menuItemsDrinks: [MenuDrinks] = [
        MenuDrinks(title: "House Beer", subtitle: "Local craft beer on tap", coints: "140,000 ₫"),
        MenuDrinks(title: "Margarita", subtitle: "Classic margarita with a salt rim\nand lime wedge", coints: "230,000 ₫"),
        MenuDrinks(title: "Iced Coffee", subtitle: "Vietnamese iced coffee with condensed milk", coints: "100,000 ₫"),
        MenuDrinks(title: "Fresh Juice", subtitle: "Freshly squeezed orange or apple juice", coints: "120,000 ₫")
       ]
    
    override func loadView() {
        view = MenuView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedButtons()
        setupInitialState()
        configureTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configureTableView() {
        contentView.tableViewAppetizers.dataSource = self
        contentView.tableViewAppetizers.delegate = self
        contentView.tableViewMainCourses.dataSource = self
        contentView.tableViewMainCourses.delegate = self
        contentView.tableViewDrinks.dataSource = self
        contentView.tableViewDrinks.delegate = self
        contentView.tableViewAppetizers.tag = 1
        contentView.tableViewMainCourses.tag = 2
        contentView.tableViewDrinks.tag = 3

    }
    
    private func setupInitialState() {
        setButtonAttributes(button: contentView.btnAppetizers, title: "Appetizers".uppercased(), font: UIFont(name: "Archivo-Regular", size: 16), color: .cYellow)
        setButtonAttributes(button: contentView.btnMainCourses, title: "Main Courses", font: UIFont.customFont(font: .archivo, style: .thin, size: 16), color: .clear)
        setButtonAttributes(button: contentView.btnDrinks, title: "Drinks", font: UIFont.customFont(font: .archivo, style: .thin, size: 16), color: .clear)
        
        contentView.tableViewAppetizers.isHidden = false
        contentView.tableViewMainCourses.isHidden = true
        contentView.tableViewDrinks.isHidden = true
    }
    
    private func tappedButtons() {
        contentView.btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        contentView.btnAppetizers.addTarget(self, action: #selector(showAppetizers), for: .touchUpInside)
        contentView.btnMainCourses.addTarget(self, action: #selector(showMainCourses), for: .touchUpInside)
        contentView.btnDrinks.addTarget(self, action: #selector(showDrinks), for: .touchUpInside)
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func showAppetizers() {
        contentView.tableViewAppetizers.isHidden = false
        contentView.tableViewMainCourses.isHidden = true
        contentView.tableViewDrinks.isHidden = true
        
        setButtonAttributes(button: contentView.btnAppetizers, title: "Appetizers".uppercased(), font: UIFont(name: "Archivo-Regular", size: 16), color: .cYellow)
        setButtonAttributes(button: contentView.btnMainCourses, title: "Main Courses", font: UIFont.customFont(font: .archivo, style: .thin, size: 16), color: .clear)
        setButtonAttributes(button: contentView.btnDrinks, title: "Drinks", font: UIFont.customFont(font: .archivo, style: .thin, size: 16), color: .clear)
    }
    
    @objc func showMainCourses() {
        contentView.tableViewAppetizers.isHidden = true
        contentView.tableViewMainCourses.isHidden = false
        contentView.tableViewDrinks.isHidden = true
        
        setButtonAttributes(button: contentView.btnMainCourses, title: "Main Courses".uppercased(), font: UIFont.customFont(font: .archivo, style: .regular, size: 16), color: .cYellow)
        setButtonAttributes(button: contentView.btnAppetizers, title: "Appetizers", font: UIFont.customFont(font: .archivo, style: .thin, size: 16), color: .clear)
        setButtonAttributes(button: contentView.btnDrinks, title: "Drinks", font: UIFont.customFont(font: .archivo, style: .thin, size: 16), color: .clear)
    }
    
    @objc func showDrinks() {
        contentView.tableViewAppetizers.isHidden = true
        contentView.tableViewMainCourses.isHidden = true
        contentView.tableViewDrinks.isHidden = false
        
        setButtonAttributes(button: contentView.btnDrinks, title: "Drinks".uppercased(), font: UIFont(name: "Archivo-Regular", size: 16), color: .cYellow)
        setButtonAttributes(button: contentView.btnAppetizers, title: "Appetizers", font: UIFont.customFont(font: .archivo, style: .thin, size: 16), color: .clear)
        setButtonAttributes(button: contentView.btnMainCourses, title: "Main Courses", font: UIFont.customFont(font: .archivo, style: .thin, size: 16), color: .clear)
    }
    
    private func setButtonAttributes(button: UIButton, title: String, font: UIFont?, color: UIColor) {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font ?? UIFont.systemFont(ofSize: 16),
            .foregroundColor: color == UIColor.cYellow ? UIColor.black : UIColor.white,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.backgroundColor = color
    }
    
    func presentAchivView(image: UIImage, title: String, subTitle: String, coint: String) {
       if fullScreenViewBonus == nil {
           fullScreenViewBonus = UIView(frame: self.view.bounds)
           fullScreenViewBonus!.backgroundColor = .black.withAlphaComponent(0.8)
           fullScreenViewBonus!.alpha = 0
           
           let imageView = UIImageView(image: .imgContPresent)
           imageView.contentMode = .scaleAspectFit
           imageView.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
           imageView.layer.shadowOpacity = 1
           imageView.layer.shadowRadius = 8
           imageView.layer.shadowOffset = CGSize(width: 0, height: 8)
           fullScreenViewBonus!.addSubview(imageView)
           
           let imgPosition = UIImageView(image: image)
           imgPosition.contentMode = .scaleAspectFit
           imgPosition.layer.cornerRadius = 16
           imgPosition.clipsToBounds = true
           imageView.addSubview(imgPosition)
           
           let titleLabel = UILabel()
           titleLabel.text = title
           titleLabel.font = .customFont(font: .aclonica, style: .regular, size: 22)
           titleLabel.textColor = .cYellow
           titleLabel.numberOfLines = 0
           titleLabel.textAlignment = .center
           imageView.addSubview(titleLabel)

           let subTitleLabel = UILabel()
           subTitleLabel.text = subTitle
           subTitleLabel.font = .customFont(font: .inter, style: .regular, size: 14)
           subTitleLabel.textColor = .white
           subTitleLabel.numberOfLines = 0
           subTitleLabel.textAlignment = .center
           imageView.addSubview(subTitleLabel)
           
           let imgCoints = UIImageView(image: .imgCoints)
           imgCoints.contentMode = .scaleAspectFit
           imageView.addSubview(imgCoints)
           
           let cointLabel = UILabel()
           cointLabel.text = coint
           cointLabel.font = .customFont(font: .archivo, style: .bold, size: 16)
           cointLabel.textColor = .cYellow
           cointLabel.numberOfLines = 0
           cointLabel.textAlignment = .center
           imageView.addSubview(cointLabel)
           
           let btnOK = UIButton()
           btnOK.configureButton(withTitle: "OK", font: .customFont(font: .aclonica, style: .regular, size: 22), titleColor: .cDarkRed, normalImage: .btnActiv, highlightedImage: .btnActivTapped)
           btnOK.addTarget(self, action: #selector(tappedCloseBuy), for: .touchUpInside)
           fullScreenViewBonus!.addSubview(btnOK)
          
           
           imageView.snp.makeConstraints { make in
               make.centerX.equalToSuperview()
               make.centerY.equalToSuperview()
               make.height.equalTo(552)
           }
           
           imgPosition.snp.makeConstraints { make in
               make.top.equalToSuperview().offset(24)
               make.centerX.equalToSuperview()
               make.width.equalTo(274)
               make.height.equalTo(288)
           }
           
           titleLabel.snp.makeConstraints { make in
               make.centerX.equalToSuperview()
               make.top.equalTo(imgPosition.snp.bottom).offset(20)
           }
         
           subTitleLabel.snp.makeConstraints { make in
               make.centerX.equalToSuperview()
               make.top.equalTo(titleLabel.snp.bottom).offset(12)
               make.width.equalTo(185)
           }
           
           cointLabel.snp.makeConstraints { make in
               make.centerX.equalToSuperview().offset(16)
               make.top.equalTo(subTitleLabel.snp.bottom).offset(24)
           }
           
           imgCoints.snp.makeConstraints { make in
               make.right.equalTo(cointLabel.snp.left).offset(-8)
               make.centerY.equalTo(cointLabel)
           }
           
           btnOK.snp.makeConstraints { make in
               make.centerX.equalToSuperview()
               make.top.equalTo(imgCoints.snp.bottom).offset(24)
               make.width.equalTo(288)
               make.height.equalTo(56)
           }
          self.view.addSubview(fullScreenViewBonus!)
       }
       UIView.animate(withDuration: 0.5, animations: {
           self.fullScreenViewBonus!.alpha = 1
       })
   }
    
   @objc func tappedCloseBuy() {
       UIView.animate(withDuration: 0.5, animations: {
           self.fullScreenViewBonus?.alpha = 0
       }) { _ in
           self.fullScreenViewBonus?.removeFromSuperview()
           self.fullScreenViewBonus = nil
       }
   }
}


extension MenuVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 1:
            return menuItemsAppe.count
        case 2:
            return menuItemsMain.count
        case 3:
            return menuItemsDrinks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.reuseId, for: indexPath) as! MenuCell
           
           switch tableView.tag {
           case 1:
               let menuItem = menuItemsAppe[indexPath.row]
               cell.configure(with: menuItem)
           case 2:
               let menuItem = menuItemsMain[indexPath.row]
               cell.configure(with: menuItem)
           case 3:
               let menuDrink = menuItemsDrinks[indexPath.row]
               cell.configureForDrinks(with: menuDrink)
           default:
               fatalError("Unexpected table view")
           }
           
           return cell
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let menuItem: MenuItem?
           switch tableView.tag {
           case 1:
               menuItem = menuItemsAppe[indexPath.row]
           case 2:
               menuItem = menuItemsMain[indexPath.row]
           case 3:
               menuItem = nil
           default:
               fatalError("Unexpected table view")
           }
           if let menuItem = menuItem, let image = UIImage(named: menuItem.imageName) {
               presentAchivView(image: image, title: menuItem.title, subTitle: menuItem.subtitle, coint: menuItem.coints)
           }

       }
   }
