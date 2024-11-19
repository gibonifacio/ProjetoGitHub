//
//  RepositoryTableViewDelegate.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 18/11/24.
//

import UIKit

class RepositoryTableViewDelegate: NSObject, UITableViewDelegate {
    
    var repository: Repository?
    
    init(repository: Repository? = nil) {
        self.repository = repository
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

}
