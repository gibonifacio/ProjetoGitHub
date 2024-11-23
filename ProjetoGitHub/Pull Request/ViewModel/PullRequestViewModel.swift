//
//  PullRequestViewModel.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 19/11/24.
//

import Foundation

class PullRequestViewModel {
    private let pullRequestManager: PullRequestManager
    
    init(pullRequestManager: PullRequestManager) {
        self.pullRequestManager = pullRequestManager
    }
    
    func getPullRequestData(item: Item) async throws -> [PullRequest] {
        try await pullRequestManager.fetchPullRequest(item: item)
    }
}


