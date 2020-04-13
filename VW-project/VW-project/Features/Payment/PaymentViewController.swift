//
//  PaymentViewController.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit
import AVFoundation

final class PaymentViewController: UIViewController {
    
    // MARK: - Default properties -
    private var _presenter: PaymentPresenterInterface!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonBuy: UIButton!
    
    var imagePicker = UIImagePickerController()
    var isFromGalleryCamera: Bool = false
    
    // MARK: - Module Setup -
    init?(coder: NSCoder, presenter: PaymentPresenterInterface) {
        _presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("(coder: NSCoder) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
        
        imagePicker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _setNavBar()
    }
    
    private func _setNavBar() {
        setBackButton(isWhite: false)
        setTitle(title: "PAYMENT", color: .black)
    }
    
    // MARK: - Setup Initial View
    private func _setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        buttonBuy.setGradient(colors: [Color.gradientOne, Color.gradientTwo,
                                       Color.gradientThree, Color.gradientFour])
        buttonBuy.layer.cornerRadius = 8
        buttonBuy.clipsToBounds = true
    }
    
    @IBAction func buyPressed(_ sender: UIButton) {
        _presenter.openNextScreen()
    }
    
    func browseImage() {
        let alertViewController = UIAlertController(title: "", message: "Choose your option", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default, handler: { (alert) in
            self.openCamera()
        })
        let gallery = UIAlertAction(title: "Gallery", style: .default) { (alert) in
            self.openGallary()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (alert) in
            
        }
        alertViewController.addAction(camera)
        alertViewController.addAction(gallery)
        alertViewController.addAction(cancel)
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            checkCamera()
        } else {
            let vc = AlertVC(title: "Sorry!", message: "This device has no camera 😔", buttonTitle: "Ok")
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true)
        }
    }
    
    func openGallary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func checkCamera() {
         let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
         switch authStatus {
         case .authorized: callCamera()
         case .denied: alertToEncourageCameraAccessInitially()
         case .notDetermined: alertPromptToAllowCameraAccessViaSetting()
         default: alertToEncourageCameraAccessInitially()
         }
     }
    
    func callCamera() {
        self.imagePicker.sourceType = .camera
        DispatchQueue.global(qos: .userInitiated).async
            {
                self.present(self.imagePicker, animated: true, completion: nil)
                
        }
    }
    
    func alertToEncourageCameraAccessInitially() {
        let alert = UIAlertController(
            title: "IMPORTANT",
            message: "Camera access required for capturing photos!",
            preferredStyle: UIAlertController.Style.alert
        )
        alert.view.layoutIfNeeded()
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Allow Camera", style: .default, handler: { (alert) -> Void in
            UIApplication.shared.openURL(URL(string: UIApplication.openSettingsURLString)!)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func alertPromptToAllowCameraAccessViaSetting() {
        
        let alert = UIAlertController(
            title: "IMPORTANT",
            message: "Camera access required for capturing photos!",
            preferredStyle: UIAlertController.Style.alert
        )
        alert.view.layoutIfNeeded()
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel) { alert in
            if AVCaptureDevice.devices(for: AVMediaType.video).count > 0 {
                AVCaptureDevice.requestAccess(for: AVMediaType.video) { granted in
                    DispatchQueue.main.async() {
                        self.checkCamera() } }
            }
            }
        )
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Extensions -
extension PaymentViewController: PaymentViewInterface {
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "singleImageCell", for: indexPath) as! SingleImageCell
            cell.singleImageView.set(imageString: "paymentMethod")
            return cell
        } else if indexPath.section == 1 || indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "singleLabelCell", for: indexPath) as! SingleLabelCell
            cell.singleLabelView.set(title: indexPath.section == 1 ?  "PAYMENT METHOD" : "PAYMENT DETAILS")
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwoImageLeftLabelCell", for: indexPath) as! TwoImageLeftLabelCell
            cell.twoImageLeftLabelView.leftView.set(title: "Credit/Debit",
                                                    imageString: "creditCard",
                                                    backgroundColor: Color.whiteTwo,
                                                    textColor: Color.brown)
            cell.twoImageLeftLabelView.leftView.setBorder()
            cell.twoImageLeftLabelView.rightView.set(title: "Apple Pay",
                                                     imageString: "companyApple",
                                                     textColor: Color.whiteThree)
            cell.twoImageLeftLabelView.rightView.setBorder()
            return cell
        } else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleTextFieldCell", for: indexPath) as! SingleTextFieldCell
            cell.textField.set(title: "NAME ON CARD")
            
            if isFromGalleryCamera {
                cell.textField.textField.text = "LE NGUYEN MINH"
            }
            
            return cell
        } else if indexPath.section == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleTextFieldCell", for: indexPath) as! SingleTextFieldCell
            cell.textField.set(title: "CARD NUMBER")
            
            if isFromGalleryCamera {
                cell.textField.textField.text = "3456 9394 9012 3400"
            }
            
            return cell
        } else if indexPath.section == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwoTextFieldCell", for: indexPath) as! TwoTextFieldCell
            cell.twoTextFieldView.leftTextField.set(title: "VALID UNTIL")
            cell.twoTextFieldView.rightTextField.set(title: "CVV")
            cell.twoTextFieldView.rightTextField.textField.isSecureTextEntry = true
            
            if isFromGalleryCamera {
                cell.twoTextFieldView.leftTextField.textField.text = "10/22"
            }
            
            return cell
        } else if indexPath.section == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScanCardCell", for: indexPath) as! ScanCardCell
            cell.scanCardView.imageLeftLabelView.set(title: "Scan my credit card",
                                                     imageString: "cameraIcon",
                                                     textColor: Color.lightOrange)
            
            cell.scanCardView.onTap = { [weak self] in
                self?.browseImage()
            }
            return cell
        } else if indexPath.section == 8 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelSwitchCell", for: indexPath) as! LabelSwitchCell
            cell.labelSwitchView.singleLabelView.set(title: "Save my card details")
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}

extension PaymentViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        isFromGalleryCamera = true
        tableView.reloadData()
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
