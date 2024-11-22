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
        
        let mockNetworkService = MockRepositoryNetworkService()
        repositoryManager = RepositoryManager(repositoryNetworkService: mockNetworkService)
    }
    
    func testFetchRepositoryData() async{
        let expectation = self.expectation(description: "Fetch Repository Data")
        do {
            let data = try await repositoryManager.fetchRequest()
            XCTAssertNotNil(data, "Data should not be nil")
            XCTAssertEqual(data.items[0].name, "gibonifacio")
            
            expectation.fulfill()
        } catch {
            XCTFail("Error \(error)")
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
}
