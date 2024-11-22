//
//  RepositoryTableViewDelegate.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 18/11/24.
//

import UIKit

class RepositoryTableViewDelegate: NSObject, UITableViewDelegate {
    
    var gitHubAPI: GitHubAPI?
    
    weak var repositoryCellDelegate: RepositoryCellDelegate?
    
    init(gitHubAPI: GitHubAPI? = nil, repositoryCellDelegate: RepositoryCellDelegate? = nil) {
        self.gitHubAPI = gitHubAPI
        self.repositoryCellDelegate = repositoryCellDelegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let gitHubAPI = gitHubAPI {
            let selectedRepository = gitHubAPI.items[indexPath.row]
            repositoryCellDelegate?.didSelectRepository(item: selectedRepository)
        }
        
        
    }
    

    

}
