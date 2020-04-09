//
//  TicketCell.swift
//  Ticket
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class TicketCell: UITableViewCell {
    
    static let reuseID = "TicketCell"
    let avatarImageView = UIImageView()
    let usernameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        _configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(ticket: Ticket) {
        usernameLabel.text = ticket.title
        avatarImageView.image = UIImage(systemName: "person.2")
    }
    
    private func _configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .center
        
        accessoryType = .disclosureIndicator
        selectionStyle = .none
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}


