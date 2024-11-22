//  ViewController.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 17/11/24.
//

import UIKit

class RepositoriesViewController: UIViewController, RepositoryCellDelegate{
    
    let pullRequestViewModel: PullRequestViewModel
    
    func didSelectRepository(item: Item) {
        let pullRequestsViewController = PullRequestsViewController(item: item, pullRequestViewModel: pullRequestViewModel)
        navigationController?.pushViewController(pullRequestsViewController, animated: true)
        
    }
    
    init(pullRequestViewModel: PullRequestViewModel, repositoryViewModel: RepositoryViewModel) {
        self.pullRequestViewModel = pullRequestViewModel
        self.repositoryViewModel = repositoryViewModel
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    var tableViewDelegate: RepositoryTableViewDelegate?
    var tableViewDataSource: RepositoryTableViewDataSource?
    var repositoryViewModel: RepositoryViewModel
    
    var gitHubAPI: GitHubAPI?
    
    var isLoading: Bool = true
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Loading..."
        label.textColor = .gray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "GitHub"
        navigationController?.navigationBar.prefersLargeTitles = true
        setText()

        
        tableViewDelegate = RepositoryTableViewDelegate()
        tableView.delegate = tableViewDelegate
        tableViewDelegate?.repositoryCellDelegate = self
        tableView.separatorStyle = .none
        
        
                

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        

        Task {
            await fetchRepositoryData()

        }
        
    }
    
    
    func fetchRepositoryData() async {
        do {
            let data = try await repositoryViewModel.getRepositoriesData()
            DispatchQueue.main.async {
                self.gitHubAPI = data
                self.tableView.reloadData()
                
                if let gitHubAPI = self.gitHubAPI {
                    self.tableViewDataSource = RepositoryTableViewDataSource(gitHubAPI: gitHubAPI)
                    self.tableView.dataSource = self.tableViewDataSource
                    self.tableViewDelegate?.gitHubAPI = gitHubAPI
                    self.setTableView()
                    self.isLoading = false

                }
                
            }
            
        } catch GitHubError.invalidURL {
            self.label.text = "Invalid URL"
            print("Error type url")
        } catch GitHubError.invalidResponse {
            self.label.text = "Invalid Response"
            print("Error type response")
        } catch GitHubError.invalidData {
            print("Error type data")
            self.label.text = "Invalid data"
        } catch {
            self.label.text = "Unknown Error"
            print(error.localizedDescription)
        }
        
        
    }
    

    
    func setTableView() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)

        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        

    }
    
    func setText() {
        
        if isLoading {
            label.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(label)
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        } else {
            self.label.removeFromSuperview()
        }
    }


}


//@available(iOS 17.0, *)
//#Preview {
//    return RepositoriesViewController()
//}
