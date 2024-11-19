//
//  Repository.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 17/11/24.
//

import Foundation

struct Repository: Codable {
    let items: [Item]
}

struct Item: Codable {
    let owner: Owner
    let forks_count: Int
    let name: String
    let stargazers_count: Int
    let description: String
}

struct Owner: Codable {
    let login: String
    let avatar_url: String
}


//struct GitHubResponse: Decodable {
//    let items: [Repository]
//}



//struct Repository: Codable {
//    
//    let id: Int
//    let name: String
//    let login: String
//    let avatar_url: String
//    let description: String
//    let stargazers_count: Int
//    let forks_count: Int
//}
