import Foundation
import UIKit

class ContactsVC: UIViewController {
    
    private var linkFacebook = "https://google.com.ua"
    private var linkInsta = "https://youtube.com"

    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
    private func tappedButtons() {
        contentView.btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        contentView.btnFacebook.addTarget(self, action: #selector(goLinkFacebook), for: .touchUpInside)
        contentView.btnInsta.addTarget(self, action: #selector(giLinkaInsta), for: .touchUpInside)
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func goLinkFacebook() {
        openWebView(with: linkFacebook)
    }
    
    @objc func giLinkaInsta() {
        openWebView(with: linkInsta)
    }
    
    private func openWebView(with urlString: String) {
        let webVC = WebViewController()
        webVC.urlString = urlString
        navigationController?.pushViewController(webVC, animated: true)
    }
}
