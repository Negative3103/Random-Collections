//
//  RandomTableViewCell.swift
//  RandomCollections
//
//  Created by Хасан Давронбеков on 04/03/24.
//

import UIKit
import SnapKit

final class RandomTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    let randomContainerView = RandomContainerView.fromNib()
    
    //MARK: - Attributes
    internal var items: [Int]? {
        didSet {
            guard let items = items else { return }
            randomContainerView.items = items
        }
    }
    
    internal var viewController: UIViewController? {
        didSet {
            randomContainerView.viewController = viewController
        }
    }
    
    //MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(randomContainerView)
        randomContainerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(10)
        }
    }
    
}
