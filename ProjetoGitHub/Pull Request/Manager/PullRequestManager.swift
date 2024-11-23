//
//  PullRequestManager.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 22/11/24.
//

import Foundation

class PullRequestManager {
    
    let pullResquestNetworkSerice: NetworkServiceProtocol
    
    init(pullResquestNetworkSerice: NetworkServiceProtocol) {
        self.pullResquestNetworkSerice = pullResquestNetworkSerice
    }
    

    func fetchPullRequest(item: Item) async throws -> [PullRequest]{
        let urlString = "https://api.github.com/repos/\(item.owner.login)/\(item.name)/pulls"
        
        do {
            let data = try await pullResquestNetworkSerice.fetchData(urlString: urlString)
            do {
                let decoder = JSONDecoder()
                let decode = try  decoder.decode([PullRequest].self, from: data)
                print(decode)
                return decode
            } catch {
                print(error.localizedDescription)
                throw GitHubError.invalidData
            }
        } catch {
            throw GitHubError.invalidURL

        }

    }
}
