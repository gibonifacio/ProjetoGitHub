//
//  RepositoryManagerTests.swift
//  ProjetoGitHubTests
//
//  Created by Giovanna Bonifacho on 22/11/24.
//

import Foundation
import XCTest

@testable import ProjetoGitHub

class RepositoryManagerTests: XCTestCase {
    var repositoryManager: RepositoryManager!
    
    override func setUp() async throws {
        try? await super.setUp()
        
        repositoryManager = RepositoryManager(repositoryNetworkService: <#T##NetworkServiceProtocol#>)
    }
    
}
