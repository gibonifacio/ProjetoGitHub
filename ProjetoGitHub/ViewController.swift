//
//  ViewController.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 17/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    let tableViewController: UITableView = {
        let tableView = UITableView()
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.identifier)
        tableView.backgroundColor = .red
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }


}

@available(iOS 17.0, *)
#Preview {
    return ViewController()
}

