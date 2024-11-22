//
//  PullRequestNetworkService.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 22/11/24.
//

import Foundation


class PullRequestNetworkService: PullRequestNetworkServiceProtocol {
    
    func fetchData(urlString: String) async throws -> Data {
        
        guard let url = URL(string: urlString) else { throw GitHubError.invalidURL }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                throw GitHubError.invalidResponse
            }
            return data
        } catch {
            print(error.localizedDescription)
            throw GitHubError.requestError
        }
    }
    
    
}


class PullRequestManager {
    
    let pullResquestNetworkSerice: PullRequestNetworkServiceProtocol
    
    init(pullResquestNetworkSerice: PullRequestNetworkServiceProtocol) {
        self.pullResquestNetworkSerice = pullResquestNetworkSerice
    }
    

    func fetchPullRequest(item: Item) async throws -> [PullRequest]{
        let urlString = "https://api.github.com/repos/\(item.owner.login)/\(item.name)/pulls"
        
        do {
            let decoder = JSONDecoder()
            let decode = try await decoder.decode([PullRequest].self, from: pullResquestNetworkSerice.fetchData(urlString: urlString))
            print(decode)
            return decode
        } catch {
            print(error.localizedDescription)
            throw GitHubError.invalidData
        }

    }
}
