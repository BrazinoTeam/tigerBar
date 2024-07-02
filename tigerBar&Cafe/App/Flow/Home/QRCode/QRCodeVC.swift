//
//  QRCodeVC.swift

import Foundation
import UIKit

class QRCodeVC: UIViewController {
    
    
    var contentView: QRCodeView {
        view as? QRCodeView ?? QRCodeView()
    }
    
    override func loadView() {
        view = QRCodeView()
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
