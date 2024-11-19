//
//  ProjetoGitHubTests.swift
//  ProjetoGitHubTests
//
//  Created by Giovanna Bonifacho on 17/11/24.
//

import XCTest
@testable import ProjetoGitHub

final class ProjetoGitHubTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() async throws {
        
        let viewModel = RepositoryViewModel()
        try await Task.sleep(nanoseconds: 4_000_000_000)
        Task {
            do {
                let repository = try await viewModel.getRepositoryData()
                //print(repository)
            } catch {
                print("aaaaa")
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
