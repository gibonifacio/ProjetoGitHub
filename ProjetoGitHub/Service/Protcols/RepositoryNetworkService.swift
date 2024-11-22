

import Foundation

protocol RepositoryNetworkServiceProtocol {
    func fetchData(url: URL) async throws -> GitHubAPI
}
