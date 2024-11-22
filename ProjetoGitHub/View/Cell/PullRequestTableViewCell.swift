//
//  PullRequestTableViewCell.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 19/11/24.
//

import Foundation
import UIKit
import Kingfisher

class PullRequestTableViewCell: UITableViewCell {
    
    static let identifier = "PullRequestTableViewCell"
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor(named: "dark-purple")
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return title
    }()
    
    let bodyLabel: UILabel = {
        let body = UILabel()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.numberOfLines = 0
        body.font = UIFont.systemFont(ofSize: 16)
        return body
    }()

    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let usernameLabel: UILabel = {
        let username = UILabel()
        username.translatesAutoresizingMaskIntoConstraints = false
        username.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        username.textColor = UIColor(named: "light-purple")
        return username
    }()
    
    var dateLabel: UILabel = {
        let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = UIFont.systemFont(ofSize: 14)
        date.textColor = .gray
        return date
    }()
    
    func configureCell(title: String, body: String, created_at: String, login: String, avatarURL: String) {

        self.titleLabel.text = title
        self.usernameLabel.text = login
        
        if body == ""{
            self.bodyLabel.text = "Não possui body"
        } else {
            self.bodyLabel.text = body
        }
    
        
        self.dateLabel.text = convertDate(dateToConvert: created_at)
        
        if let url = URL(string: avatarURL) {
            self.image.kf.setImage(with: url)
        } else {
            print("URL inválida: \(avatarURL)")
        }

        setElements()
    }
    
    
    func setElements() {
        
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
            
        ])
        
        
        
        contentView.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            bodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])


        
        
        
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 10),
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        contentView.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 14),
            usernameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
        ])
        
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor)
        ])
        
    
        
    }
    
    func convertDate(dateToConvert: String) -> String{
        let formatter = ISO8601DateFormatter()
        

        if let date = formatter.date(from: dateToConvert) {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            let formattedDate = formatter.string(from: date)
            return formattedDate
        }
        
        return ""
    }
    
}
