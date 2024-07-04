import Foundation
import UIKit
import SafariServices
import MessageUI

class ContactsVC: UIViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
    
    private var linkFacebook = "https://www.facebook.com/tigerbarjune"
    private var linkInsta = "https://www.instagram.com/tigerbarjune"
    private var callNumber = "(760) 648-7774"
    private var sendEmail = "info@tigerbarandcafe.com"

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
        contentView.callLabel.text = "\(callNumber)"
        contentView.messageLabel.text = "\(sendEmail)"
    }
    
    private func tappedButtons() {
        contentView.btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        contentView.btnFacebook.addTarget(self, action: #selector(goLinkFacebook), for: .touchUpInside)
        contentView.btnInsta.addTarget(self, action: #selector(giLinkaInsta), for: .touchUpInside)
        contentView.sendBtn.addTarget(self, action: #selector(sendEmailAction), for: .touchUpInside)
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
        guard let url = URL(string: urlString) else { return }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
    }
    
    @objc func sendEmailAction() {
        guard MFMailComposeViewController.canSendMail() else {
            print("Mail services are not available")
            return
        }
        
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients([sendEmail])
        
        let name = contentView.nameTextField.text ?? ""
        let email = contentView.emailTextField.text ?? ""
        let message = contentView.messageTextView.text ?? ""
        
        let emailBody = """
        Name: \(name)
        Email: \(email)
        
        Message:
        \(message)
        """
        
        mailComposeVC.setMessageBody(emailBody, isHTML: false)
        
        present(mailComposeVC, animated: true, completion: nil)
    }
    
    // MARK: - MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true) {
            // Очистка текстовых полей и текстового представления после отправки письма
            self.contentView.nameTextField.text = ""
            self.contentView.emailTextField.text = ""
            self.contentView.messageTextView.text = ""
        }
    }
}
