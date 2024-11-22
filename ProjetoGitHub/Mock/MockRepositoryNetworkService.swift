//
//  MockRepositoryNetworkingService.swift
//  ProjetoGitHubTests
//
//  Created by Giovanna Bonifacho on 22/11/24.
//

import Foundation

class MockRepositoryNetworkService: NetworkServiceProtocol {
    
    func fetchData(urlString: String) async throws -> Data {
        let mockJson = """
    {
        "items": [{
            "name": "gibonifacio",
            "owner": {
                "login": "gibonifacio123",
                "avatar_url": "gibonifacio"
            },
            "forks_count": 12345,
            "stargazers_count": 5678,
            "description": "oi tudo bem?"
        }]
    }
    """
        guard let jsonData = mockJson.data(using: .utf8) else {
            throw GitHubError.requestError
        }
        
        return jsonData
        
    }
}
