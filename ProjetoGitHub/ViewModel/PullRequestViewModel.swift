//
//  PullRequestViewModel.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 19/11/24.
//

import Foundation

class PullRequestViewModel {
    
    @MainActor func getPullRequestsData(item: Item) async throws -> [PullRequest] {
        let urlString = "https://api.github.com/repos/\(item.owner.login)/\(item.name)/pulls"
        
        guard let url = URL(string: urlString) else { throw GitHubError.invalidURL }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                throw GitHubError.invalidResponse
            }
            do {
                let decoder = JSONDecoder()
                let decode = try decoder.decode([PullRequest].self, from: data)
                print(decode)
                return decode
            } catch {
                print(error.localizedDescription)
                throw GitHubError.invalidData
            }
        } catch {
            print(error.localizedDescription)
            throw GitHubError.requestError
        }
        
    }
    
    
}
