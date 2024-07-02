//
//  HomeVC.swift

import Foundation
import UIKit

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
    }
    
    @objc func goContacts() {
        let vc = ContactsVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goAboutUs() {
        let vc = AboutUsVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
