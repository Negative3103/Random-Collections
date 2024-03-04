//
//  MainDataProvider.swift
//  RandomCollections
//
//  Created by Хасан Давронбеков on 04/03/24.
//

import UIKit

final class MainDataProvider: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets
    weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    var cachedPosition = Dictionary<IndexPath,CGPoint>()
    internal var items = [MainCollection]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RandomTableViewCell.defaultReuseIdentifier, for: indexPath) as? RandomTableViewCell else { return UITableViewCell() }
        cell.viewController = viewController
        cell.items = items[indexPath.row].items
        cell.randomContainerView.collectionView.contentOffset = cachedPosition[indexPath] ?? .zero
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? RandomTableViewCell else { return }
        cachedPosition[indexPath] = cell.randomContainerView.collectionView.contentOffset
    }
    
    //MARK: - Delegate
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
}
