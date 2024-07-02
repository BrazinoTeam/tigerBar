//
//  QRCodeVC.swift

import Foundation
import UIKit

class QRCodeVC: UIViewController {
    
    
    private var contentView: QRCodeView {
        view as? QRCodeView ?? QRCodeView()
    }
    
    override func loadView() {
        view = QRCodeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tappedButtons()
    }

    private func tappedButtons() {
    }
    
  
}
