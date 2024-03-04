//
//  RandomDataProvider.swift
//  RandomCollections
//
//  Created by Хасан Давронбеков on 04/03/24.
//

import UIKit

final class RandomDataProvider: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Outlets
    weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    internal var items = [Int]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Lifecycles
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RandomCollectionViewCell.defaultReuseIdentifier, for: indexPath) as? RandomCollectionViewCell else { return UICollectionViewCell() }
        cell.numberLabel.text = "\(items[indexPath.row])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}
