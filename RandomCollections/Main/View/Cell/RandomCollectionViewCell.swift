//
//  RandomCollectionViewCell.swift
//  RandomCollections
//
//  Created by Хасан Давронбеков on 04/03/24.
//

import UIKit

final class RandomCollectionViewCell: CustomCollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    
    //MARK: - Lifecycles
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.appColor(.grey).cgColor
    }
}
