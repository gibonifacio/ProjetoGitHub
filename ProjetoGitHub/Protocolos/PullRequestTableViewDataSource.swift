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
            cell.configureCell(title: pullRequest.title, body: pullRequest.body ?? "Não possui body", created_at: pullRequest.created_at, login: pullRequest.user.login, avatarURL: pullRequest.user.avatar_url)
        }
        
        return cell
        
    }
    

    
}
