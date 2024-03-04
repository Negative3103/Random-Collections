//
//  RandomContainerView.swift
//  RandomCollections
//
//  Created by Хасан Давронбеков on 04/03/24.
//

import UIKit

final class RandomContainerView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: RandomCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: RandomCollectionViewCell.defaultReuseIdentifier)
            dataProvider.collectionView = collectionView
        }
    }
    
    //MARK: - Attributes
    internal let dataProvider = RandomDataProvider()
    weak var viewController: UIViewController? {
        didSet {
            dataProvider.viewController = viewController
        }
    }
    internal var items: [Int]? {
        didSet {
            guard let items = items else { return }
            dataProvider.items = items
        }
    }
    
    //MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = heightAnchor.constraint(equalToConstant: 100)
        addConstraint(heightConstraint)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
}
