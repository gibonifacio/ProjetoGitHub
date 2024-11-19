//
//  PullRequestTableViewDataSource.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 19/11/24.
//

import UIKit

class PullRequestTableViewDataSource: NSObject, UITableViewDataSource {
    
    var pullRequests: [PullRequest]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PullRequestTableViewCell.identifier, for: indexPath) as? PullRequestTableViewCell else {
            fatalError("failed")
        }
        
        let pullRequest = self.pullRequests?[indexPath.row]
        if let pullRequest = pullRequest {
            cell.configureCell(title: pullRequest.title, body: pullRequest.body, created_at: pullRequest.body, login: pullRequest.user.login, avatarURL: pullRequest.user.avatarURL)
        }
        
        return cell
        
    }
    

    
}
