//
//  ContactsVC.swift


import Foundation
import UIKit

class ContactsVC: UIViewController {
    
    
    private var contentView: ContactsView {
        view as? ContactsView ?? ContactsView()
    }
    
    override func loadView() {
        view = ContactsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tappedButtons()
    }

    private func tappedButtons() {
    }
    
  
}
