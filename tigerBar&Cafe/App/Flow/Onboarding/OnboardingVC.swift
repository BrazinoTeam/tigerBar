//
//  OnboardingVC.swift

import Foundation
import UIKit

class OnboardingVC: UIViewController {
    
    private var contentView: OnboardingView {
        view as? OnboardingView ?? OnboardingView()
    }
    
    override func loadView() {
        view = OnboardingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layoutIfNeeded()
        animateProgressBar()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                  self.loadHomeVC()
              }
    }
    
    func animateProgressBar() {
        UIView.animate(withDuration: 1.5) {
            self.contentView.progressView.setProgress(1.0, animated: true)
        }
    }
    func loadHomeVC() {
      
                    let vc = HomeVC()
                    let navigationController = UINavigationController(rootViewController: vc)
                    navigationController.modalPresentationStyle = .fullScreen
                    present(navigationController, animated: true)
            
        }
    
}
