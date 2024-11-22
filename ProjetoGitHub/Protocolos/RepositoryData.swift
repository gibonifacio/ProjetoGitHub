//
//  RepositoryData.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 22/11/24.
//

import Foundation

protocol RepositoryData {
    func getRepositoryDat() async throws -> GitHubAPI
}
