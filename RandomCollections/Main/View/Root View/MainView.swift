//
//  MainView.swift
//  RandomCollections
//
//  Created by Хасан Давронбеков on 04/03/24.
//

import UIKit

final class MainView: CustomView {
    
    //MARK: - Outlet
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: RandomTableViewCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: RandomTableViewCell.defaultReuseIdentifier)
        }
    }
}
