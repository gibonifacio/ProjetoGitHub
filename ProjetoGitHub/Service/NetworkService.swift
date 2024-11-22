//
//  PullRequestNetworkService.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 22/11/24.
//

import Foundation


class NetworkService: NetworkServiceProtocol {
    
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

