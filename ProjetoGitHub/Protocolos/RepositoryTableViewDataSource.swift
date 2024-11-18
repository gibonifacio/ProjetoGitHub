//
//  RepositoryTableViewDataSource.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 18/11/24.
//

import UIKit

class RepositoryTableViewDataSource: NSObject, UITableViewDataSource {
    
    var repositories: [Repository]?
    
    init(repositories: [Repository]) {
        self.repositories = repositories
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories?.count ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.identifier, for: indexPath) as? RepositoryTableViewCell else {
            fatalError("failed")
        }
        
        let repository = self.repositories?[indexPath.row]
        cell.configureCell(name: repository!.name, login: repository?.login ?? "a", avatar_url: repository?.avatar_url ?? "b", description: repository?.description ?? "c", stargazers_count: repository?.stargazers_count ?? 1, forks_count: repository?.forks_count ?? 2)
        
        
        return cell
        
    }
    
    

}
