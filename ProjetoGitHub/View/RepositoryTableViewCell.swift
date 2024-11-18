//
//  RepositoryTableViewCell.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 18/11/24.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    var repository: Repository
    
    init(repository: Repository, style: UITableViewCell.CellStyle = .default, reuseIdentifier: String? = nil) {
        self.repository = repository
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setElements()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.text = "teste"
        return title
    }()
    
    let bodyLabel: UILabel = {
        let body = UILabel()
        body.translatesAutoresizingMaskIntoConstraints = false
        body.text = "teste"
        body.numberOfLines = 2
        return body
    }()
    
    let forksLabel: UILabel = {
        let forks = UILabel()
        forks.translatesAutoresizingMaskIntoConstraints = false
        forks.text = "10"
        return forks
    }()
    
    let starsLabel: UILabel = {
        let stars = UILabel()
        stars.translatesAutoresizingMaskIntoConstraints = false
        stars.text = "200"
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
    
    var nameLabel: UILabel {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
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
        self.addSubview(nameLabel)
        
    }
}


@available(iOS 17.0, *)
#Preview {
    return RepositoryTableViewCell(repository: Repository(id: 12, name: "aaaaa", login: "aaaaa", avatar_url: "aaaa", description: "aaaaa", stargazers_count: 12, forks_count: 10))
}
