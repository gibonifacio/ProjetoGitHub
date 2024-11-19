//
//  PullRequestTableViewCell.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 19/11/24.
//

import Foundation
import UIKit

class PullRequestTableViewCell: UITableViewCell {
    
    static let identifier = "PullRequestTableViewCell"
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        return title
    }()
    
    let bodyLabel: UILabel = {
        let body = UILabel()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.numberOfLines = 2
        return body
    }()

    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        return image
    }()
    
    let usernameLabel: UILabel = {
        let username = UILabel()
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()
    
    var dateLabel: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    func configureCell(title: String, body: String, created_at: String, login: String, avatarURL: String) {

        self.titleLabel.text = title
        self.usernameLabel.text = login
        self.bodyLabel.text = body
        self.dateLabel.text = created_at

        setElements()
    }
    
    
    func setElements() {
        
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25)
            
        ])
        
        self.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
        
        
        self.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor)
        ])
        
        
        self.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            image.heightAnchor.constraint(equalToConstant: 30),
            image.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        self.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            usernameLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20)
        ])
        

        
    }
    
}
