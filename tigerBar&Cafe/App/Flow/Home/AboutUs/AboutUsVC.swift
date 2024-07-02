//
//  AboutUsVC.swift

import Foundation
import UIKit

class AboutUsVC: UIViewController {
    
    
    private var contentView: AboutUsView {
        view as? AboutUsView ?? AboutUsView()
    }
    
    override func loadView() {
        view = AboutUsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tappedButtons()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
    private func tappedButtons() {
        contentView.btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
  
}
