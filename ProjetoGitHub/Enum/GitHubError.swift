//
//  GitHubError.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 22/11/24.
//

import Foundation

enum GitHubError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case requestError
}
