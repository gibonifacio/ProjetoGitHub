//
//  ViewController.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 17/11/24.
//

import UIKit

class RepositoriesViewController: UIViewController, RepositoryCellDelegate{
    
    func didSelectRepository(item: Item) {
        let pullRequestsViewController = PullRequestsViewController(item: item)
        navigationController?.pushViewController(pullRequestsViewController, animated: true)
        
    }
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.identifier)
        tableView.backgroundColor = .red
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    var tableViewDelegate: RepositoryTableViewDelegate?
    var tableViewDataSource: RepositoryTableViewDataSource?
    var repositoryViewModel: RepositoryViewModel = RepositoryViewModel()
    
    var gitHubAPI: GitHubAPI?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "GitHub"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        tableViewDelegate = RepositoryTableViewDelegate()
        tableView.delegate = tableViewDelegate
        tableViewDelegate?.repositoryCellDelegate = self
        
        setTableView()
                
        Task {
            await fetchRepositoryData()
            
        }
    }
    
    
    
    func fetchRepositoryData() async {
        do {
            let data = try await repositoryViewModel.getRepositoryData()
            DispatchQueue.main.async {
                self.gitHubAPI = data
                self.tableView.reloadData()
                
                if let gitHubAPI = self.gitHubAPI {
                    self.tableViewDataSource = RepositoryTableViewDataSource(gitHubAPI: gitHubAPI)
                    self.tableView.dataSource = self.tableViewDataSource
                    self.tableViewDelegate?.gitHubAPI = gitHubAPI


                }
                
            }
            
        } catch GitHubError.invalidData {
            print("Error type data")
        } catch GitHubError.invalidResponse {
            print("Error type response")
        } catch GitHubError.invalidURL {
            print("Error type url")
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    

    
    func setTableView() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30)
        ])
    }


}

@available(iOS 17.0, *)
#Preview {
    return RepositoriesViewController()
}
