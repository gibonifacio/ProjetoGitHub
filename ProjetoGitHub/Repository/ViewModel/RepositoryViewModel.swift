//
//  RepositoryViewModel.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 18/11/24.
//

import Foundation

class RepositoryViewModel {
    
    private let repositoryManager: RepositoryManager
    
    init(repositoryManager: RepositoryManager) {
        self.repositoryManager = repositoryManager
    }
    
    func getRepositoriesData() async throws -> GitHubAPI {
        try await repositoryManager.fetchRequest()
    }
    
}

