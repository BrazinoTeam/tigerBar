//
//  MenuVC.swift

import Foundation
import UIKit

class MenuVC: UIViewController {
    
    
    private var contentView: MenuView {
        view as? MenuView ?? MenuView()
    }
    
    override func loadView() {
        view = MenuView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tappedButtons()
    }

    private func tappedButtons() {
    }
    
  
}
