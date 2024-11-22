//
//  Item.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 19/11/24.
//

import Foundation

struct Item: Codable {
    let owner: Owner
    let forks_count: Int
    let name: String
    let stargazers_count: Int
    let description: String
}
