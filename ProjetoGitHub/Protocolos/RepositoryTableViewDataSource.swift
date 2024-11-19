//
//  RepositoryTableViewDataSource.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 18/11/24.
//

import UIKit

class RepositoryTableViewDataSource: NSObject, UITableViewDataSource {
    
    var repository: Repository?

    init(repository: Repository) {
        self.repository = repository
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repository?.items.count ?? 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.identifier, for: indexPath) as? RepositoryTableViewCell else {
            fatalError("failed")
        }
        
        let repository = self.repository?.items[indexPath.row]
        if let repository = repository {
            cell.configureCell(name: repository.name, login: repository.owner.login, avatarUrl: repository.owner.avatar_url, description: repository.description, stargazersCount: repository.stargazers_count, forksCount: repository.forks_count)
        }

        return cell
        
    }
    
    

}
