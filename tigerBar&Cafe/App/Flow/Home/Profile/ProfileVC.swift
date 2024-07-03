//
//  ProfileVC.swift

import Foundation
import UIKit

class ProfileVC: UIViewController {
    
    private let imagePicker = UIImagePickerController()

    private var contentView: ProfileView {
        view as? ProfileView ?? ProfileView()
    }
    
    override func loadView() {
        view = ProfileView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerDelegate()
        tappedButtons()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        checkFotoLoad()
    }
    
    private func pickerDelegate() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    private func checkFotoLoad() {
            let userID = UserMemory.shared.userID
            if let savedImage = contentView.userPhoto.getImageFromLocal(userID: String(userID)) {
                contentView.userPhoto.setBackgroundImage(savedImage, for: .normal)
            }
        }
    
    private func tappedButtons() {
        contentView.btnBack.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        contentView.btnChangeName.addTarget(self, action: #selector(tappeUpdateName), for: .touchUpInside)
        contentView.userPhoto.addTarget(self, action: #selector(goTakePhoto), for: .touchUpInside)

    }
    
    @objc func tappeUpdateName() {
        contentView.profileTextField.becomeFirstResponder()
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func goTakePhoto() {
        let alert = UIAlertController(title: "Pick Library", message: nil, preferredStyle: .actionSheet)
        
        let actionLibrary = UIAlertAction(title: "Photo Library", style: .default) { _ in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCamera = UIAlertAction(title: "Camera", style: .default) { _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            } else {
                print("Camera not available")
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(actionCamera)
        alert.addAction(actionLibrary)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            contentView.userPhoto.setBackgroundImage(image, for: .normal)
            let userID = UserMemory.shared.userID
            contentView.userPhoto.saveImageToLocal(image: image, userID: String(userID))
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
