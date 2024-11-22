//
//  PullRequestsViewController.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 19/11/24.
//

import UIKit

class PullRequestsViewController: UIViewController {
    
    let item: Item
    let pullRequestViewModel: PullRequestViewModel
    var pullRequests: [PullRequest]?
    
    var tableViewDelegate: PullRequestTableViewDelegate?
    var tableViewDataSource: PullRequestTableViewDataSource?
    
    init(item: Item, pullRequestViewModel: PullRequestViewModel) {
        self.item = item
        self.pullRequestViewModel = pullRequestViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let text: UILabel = {
        let text = UILabel()
        text.text = "Loading..."
        text.textColor = .gray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PullRequestTableViewCell.self, forCellReuseIdentifier: PullRequestTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        
        return tableView
    }()
    
    var isLoading: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = item.name

        tableViewDelegate = PullRequestTableViewDelegate()
        tableView.delegate = tableViewDelegate
        
        setIsLoadingText()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Task {
            await fetchPullRequests()
        }
    }
    
    func fetchPullRequests() async {
        do {
            let data = try await pullRequestViewModel.getPullRequestData(item: item)
            DispatchQueue.main.async {
                self.pullRequests = data
                self.tableView.reloadData()
                self.tableViewDataSource = PullRequestTableViewDataSource()
                self.tableViewDataSource?.pullRequests = self.pullRequests
                self.tableView.dataSource = self.tableViewDataSource
                if data.count > 1 {
                    self.isLoading = false
                    self.setTableView()
                } else {
                    self.text.text = "This Repository doesn't have public Pull Requests"
                }
                
            }
        } catch GitHubError.invalidData{
            print("Error type data")
        } catch GitHubError.invalidResponse {
            print("Error type response")
        } catch GitHubError.invalidURL {
            print("Error type URL")
        } catch {
            print(error.localizedDescription)
        }
    }
    

    func setTableView() {
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setIsLoadingText() {
        
        if isLoading {
            self.view.addSubview(text)
            
            NSLayoutConstraint.activate([
                text.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                text.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
        } else {
            text.removeFromSuperview()
        }
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
