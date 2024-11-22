//
//  RepositoryTableViewCell.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 18/11/24.
//

import UIKit

import Kingfisher

class RepositoryTableViewCell: UITableViewCell {
    
    static let identifier = "RepositoryCell"
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = .zero
        view.layer.cornerRadius = 12

        return view
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor(named: "dark-purple")
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
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
        forks.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        forks.textColor = UIColor(named: "light-purple")
        return forks
    }()
    
    let starsLabel: UILabel = {
        let stars = UILabel()
        stars.translatesAutoresizingMaskIntoConstraints = false
        stars.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        stars.textColor = UIColor(named: "light-purple")

        return stars
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
        username.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        username.textColor = UIColor(named: "lilac")
        return username
    }()
    
    let forkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "tuningfork")
        image.tintColor = UIColor(named: "light-purple")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let starsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = UIColor(named: "light-purple")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func configureCell(name: String, login: String, avatarUrl: String, description: String, stargazersCount: Int, forksCount: Int) {

        self.titleLabel.text = name
        self.usernameLabel.text = login
        self.bodyLabel.text = description
        self.starsLabel.text = String(stargazersCount)
        self.forksLabel.text = String(forksCount)
        if let url = URL(string: avatarUrl) {
            self.image.kf.setImage(with: url)
        } else {
            print("URL inválida: \(avatarUrl)")
        }
        setElements()
    }
    
    
    func setElements() {
        self.addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12)
        ])

        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])

        view.addSubview(bodyLabel)
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyLabel.widthAnchor.constraint(equalToConstant: 220)
        ])

        view.addSubview(forkImage)
        NSLayoutConstraint.activate([
            forkImage.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 10),
            forkImage.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor),
            forkImage.widthAnchor.constraint(equalToConstant: 16),
            forkImage.heightAnchor.constraint(equalToConstant: 16)
        ])

        view.addSubview(forksLabel)
        NSLayoutConstraint.activate([
            forksLabel.centerYAnchor.constraint(equalTo: forkImage.centerYAnchor),
            forksLabel.leadingAnchor.constraint(equalTo: forkImage.trailingAnchor, constant: 8)
        ])

        view.addSubview(starsImage)
        starsImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starsImage.centerYAnchor.constraint(equalTo: forkImage.centerYAnchor),
            starsImage.leadingAnchor.constraint(equalTo: forksLabel.trailingAnchor, constant: 20),
            starsImage.widthAnchor.constraint(equalToConstant: 16),
            starsImage.heightAnchor.constraint(equalToConstant: 16)
        ])

        view.addSubview(starsLabel)
        NSLayoutConstraint.activate([
            starsLabel.centerYAnchor.constraint(equalTo: starsImage.centerYAnchor),
            starsLabel.leadingAnchor.constraint(equalTo: starsImage.trailingAnchor, constant: 8)
        ])

        view.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalToConstant: 50)
        ])

        view.addSubview(usernameLabel)
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

    }

    

}


//@available(iOS 17.0, *)
//#Preview {
//    return RepositoryTableViewCell(repository: Repository(id: 12, name: "aaaaa", login: "aaaaa", avatar_url: "aaaa", description: "aaaaa", stargazers_count: 12, forks_count: 10))
//}
