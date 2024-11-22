//
//  RepositoryViewModel.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 18/11/24.
//

import Foundation

class RepositoryViewModel {
    
    @MainActor func getRepositoryData() async throws -> GitHubAPI {
        let urlString = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1"
        
        guard let url = URL(string: urlString) else { throw GitHubError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                throw GitHubError.invalidResponse
            }
            do {
                let decoder = JSONDecoder()
                let decode =  try decoder.decode(GitHubAPI.self, from: data)
                print(decode)
                return decode
            } catch {
                print(error.localizedDescription)
                throw GitHubError.invalidData
            }
        } catch {
            print("Error de request")
            throw GitHubError.requestError
        }
    }
    
}


enum GitHubError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case requestError
}
