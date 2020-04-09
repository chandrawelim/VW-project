//
//  TicketDetailViewController.swift
//  Ticket
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class TicketDetailViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: TicketDetailPresenterInterface!
    
    var ticket: Ticket!
    @IBOutlet weak var ticketImageView: UIImageView!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    // MARK: - Module Setup -
    func set(presenter: TicketDetailPresenterInterface) {
        _presenter = presenter
    }

    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
        _configButton()
        
        ticketImageView.image = UIImage(systemName: "person.2")
        titleLabel.text = "Hotel A"
        descLabel.text = "Hotel A is the splendid choice for you who are seeking a luxurious treat for your holiday. Get pampered with the most excellent services and make your holiday memorable by staying here."
    }
    
    private func _configButton() {
        bookButton.layer.cornerRadius = 10
        bookButton.setTitleColor(.white, for: .normal)
        bookButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        bookButton.backgroundColor = .systemGreen
    }
    
    @IBAction func bookPressed(_ sender: UIButton) {
        let alertVC = AlertVC(title: "Yay", message: "Booking successful 🎉", buttonTitle: "Ok")
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        self.present(alertVC, animated: true)
    }
    
    // MARK: - Setup Initial View
    private func _setupView() {
        // Write your initial setup here
    }

}

// MARK: - Extensions -
extension TicketDetailViewController: TicketDetailViewInterface {
}
