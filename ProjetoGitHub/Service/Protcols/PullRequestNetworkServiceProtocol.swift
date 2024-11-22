//
//  PullRequestService.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 22/11/24.
//

import Foundation

protocol PullRequestNetworkServiceProtocol {
    func fetchData(urlString: String) async throws -> Data
}
