//
//  PullRequest.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 18/11/24.
//

import Foundation

struct PullRequest: Codable {
        
    let title: String
    let body: String
    let created_at: Date
    let user: User
    
}

struct User: Codable {
    let login: String
    let avatarURL: String
}
