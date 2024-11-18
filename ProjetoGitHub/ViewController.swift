//
//  ViewController.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 17/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.identifier)
        tableView.backgroundColor = .red
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    var tableViewDelegate: RepositoryTableViewDelegate?
    var tableViewDataSource: RepositoryTableViewDataSource?
    
    var repositories: [Repository] =  [Repository(id: 12, name: "aaaa", login: "bbbb", avatar_url: "cccc", description: "dddd", stargazers_count: 33, forks_count: 60), Repository(id: 12, name: "xxxx", login: "zzzz", avatar_url: "yyyy", description: "wwww", stargazers_count: 78, forks_count: 12) ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "GitHub"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableViewDelegate = RepositoryTableViewDelegate()
        tableViewDataSource = RepositoryTableViewDataSource(repositories: repositories)
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        
        setTableView()
        
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
    return ViewController()
}

