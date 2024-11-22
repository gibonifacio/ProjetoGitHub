//
//  RepositoryManager.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 22/11/24.
//

import Foundation


class RepositoryManager {
    let repositoryNetworkService: NetworkServiceProtocol
    
    init(repositoryNetworkService: NetworkServiceProtocol) {
        self.repositoryNetworkService = repositoryNetworkService
    }
    
    func fetchRequest() async throws -> GitHubAPI {
        let urlString = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1"
        
        
        do {
            let data = try await repositoryNetworkService.fetchData(urlString: urlString)
            do {
                let decoder = JSONDecoder()
                let decode = try decoder.decode(GitHubAPI.self, from: data)
                return decode
            } catch {
                print(error.localizedDescription)
                throw GitHubError.invalidData
            }
        } catch {
            print("URL inválida.")
            throw GitHubError.invalidURL
        }
        
        
    }

    
    

}
