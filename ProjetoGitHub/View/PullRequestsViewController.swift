//
//  PullRequestsViewController.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 19/11/24.
//

import UIKit

class PullRequestsViewController: UIViewController {
    
    let item: Item
    let pullRequestViewModel = PullRequestViewModel()
    var pullRequests: [PullRequest]?
    
    var tableViewDelegate: PullRequestTableViewDelegate?
    var tableViewDataSource: PullRequestTableViewDataSource?
    
    init(item: Item) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PullRequestTableViewCell.self, forCellReuseIdentifier: PullRequestTableViewCell.identifier)
        tableView.backgroundColor = .red
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
//    var tableViewDelegate: 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = item.name
        navigationController?.navigationBar.prefersLargeTitles = true

        tableViewDelegate = PullRequestTableViewDelegate()
        tableView.delegate = tableViewDelegate
        setTableView()
        
        Task {
            await fetchPullRequests()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func fetchPullRequests() async {
        do {
            let data = try await pullRequestViewModel.getPullRequestsData(item: item)
            DispatchQueue.main.async {
                self.pullRequests = data
                self.tableView.reloadData()
                self.tableViewDataSource = PullRequestTableViewDataSource()
                self.tableViewDataSource?.pullRequests = self.pullRequests
                self.tableView.dataSource = self.tableViewDataSource
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30)
        ])
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
