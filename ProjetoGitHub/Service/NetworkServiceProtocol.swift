//
//  NetworkServiceProtocol.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 22/11/24.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(urlString: String) async throws -> Data
}

