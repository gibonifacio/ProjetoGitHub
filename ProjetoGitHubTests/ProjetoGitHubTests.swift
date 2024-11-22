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

    func testGetRepositoryData() async throws {
        
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
    
    func testGetPullRequestsData() async throws {
        let pullRequestViewModel = PullRequestViewModel()
        try await Task.sleep(nanoseconds: 20_000_000_000)
        print("antes antes")
        Task {
            do {
                print("antes")
                let pullRequests = try await pullRequestViewModel.getPullRequestsData(item: Item(owner: Owner(login: "Alamofire", avatar_url: "Alamofire"), forks_count: 1, name: "Alamofire", stargazers_count: 2, description: "Alamofire"))
                print(pullRequests)
                print("foi")
            } catch {
                print(error.localizedDescription)
                print("nao foi")

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
