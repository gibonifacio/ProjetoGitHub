//
//  RepositoryViewModel.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 18/11/24.
//

import Foundation


class RepositoryViewModel {
    
    @MainActor func getRepositoryData() async throws -> Repository {
        let urlString = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1"
        
        guard let url = URL(string: urlString) else { throw GitHubError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("aaaaaaaaaaaaaaaaaaa")
                throw GitHubError.invalidResponse
            }
            do {
                let decoder = JSONDecoder()
                let decode =  try decoder.decode(Repository.self, from: data)
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
    
    func getData() {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1") else {
            fatalError("missing url")
        }
        
        let urlRequest = URLRequest(url: url)
        
        // cria e inicia uma tarefa de transferência de dados usando uma solicitação especificada e um manipulador de conclusão (completion handler) que é chamado quando a tarefa é concluída, retornando os dados recebidos do servidor, a resposta HTTP e quaisquer erros ocorridos durante a solicitação.
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Status should be: ", response)
                return
            }
            

        }
        dataTask.resume()
    }
}


enum GitHubError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case requestError
}
