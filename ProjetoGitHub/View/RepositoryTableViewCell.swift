//
//  RepositoryTableViewCell.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 18/11/24.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    static let identifier = "RepositoryCell"
    

    
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
    
    let forksLabel: UILabel = {
        let forks = UILabel()
        forks.translatesAutoresizingMaskIntoConstraints = false
        return forks
    }()
    
    let starsLabel: UILabel = {
        let stars = UILabel()
        stars.translatesAutoresizingMaskIntoConstraints = false
        return stars
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
    
    func configureCell(name: String, login: String, avatar_url: String, description: String, stargazers_count: Int, forks_count: Int) {

        self.titleLabel.text = name
        self.usernameLabel.text = login
        self.bodyLabel.text = description
        self.starsLabel.text = String(stargazers_count)
        self.forksLabel.text = String(forks_count)
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
        
        
        self.addSubview(forksLabel)
        
        NSLayoutConstraint.activate([
            forksLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 10),
            forksLabel.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor)
        ])
        
        self.addSubview(starsLabel)
        
        NSLayoutConstraint.activate([
            starsLabel.topAnchor.constraint(equalTo: forksLabel.topAnchor),
            starsLabel.leadingAnchor.constraint(equalTo: forksLabel.leadingAnchor, constant: 30)
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


//@available(iOS 17.0, *)
//#Preview {
//    return RepositoryTableViewCell(repository: Repository(id: 12, name: "aaaaa", login: "aaaaa", avatar_url: "aaaa", description: "aaaaa", stargazers_count: 12, forks_count: 10))
//}
