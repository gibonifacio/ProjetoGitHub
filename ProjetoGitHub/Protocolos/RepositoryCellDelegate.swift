//
//  RepositoryCellDelegate.swift
//  ProjetoGitHub
//
//  Created by Giovanna Bonifacho on 19/11/24.
//

import Foundation

protocol RepositoryCellDelegate: AnyObject {
    func didSelectRepository(item: Item)
}
