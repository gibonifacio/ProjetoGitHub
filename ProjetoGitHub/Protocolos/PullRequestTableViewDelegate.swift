//
//  PullRequestTableViewDelegate.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 19/11/24.
//

import UIKit

class PullRequestTableViewDelegate: NSObject, UITableViewDelegate {

    var pullRequests: [PullRequest]?
    
    init(pullRequests: [PullRequest]? = nil) {
        self.pullRequests = pullRequests
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
}
