//
//  PaymentViewController.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class PaymentViewController: UIViewController {
    
    // MARK: - Default properties -
    private var _presenter: PaymentPresenterInterface!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonBuy: UIButton!
    
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
}

// MARK: - Extensions -
extension PaymentViewController: PaymentViewInterface {
}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
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
            cell.twoImageLeftLabelView.leftView.set(title: "Credit/Debit", imageString: "creditCard")
            cell.twoImageLeftLabelView.rightView.set(title: "Apple Pay", imageString: "companyApple")
            return cell
        } else if indexPath.section == 4 || indexPath.section == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleTextFieldCell", for: indexPath) as! SingleTextFieldCell
            cell.textField.set(title: indexPath.section == 4 ? "NAME ON CARD" : "CARD NUMBER")
            return cell
        } else if indexPath.section == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TwoTextFieldCell", for: indexPath) as! TwoTextFieldCell
            cell.twoTextFieldView.leftTextField.set(title: "VALID UNTIL")
            cell.twoTextFieldView.rightTextField.set(title: "CVV")
            return cell
        } else if indexPath.section == 7 {
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
