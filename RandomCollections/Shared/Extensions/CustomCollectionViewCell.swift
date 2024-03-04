//
//  CustomCollectionViewCell.swift
//  RandomCollections
//
//  Created by Хасан Давронбеков on 04/03/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Lifecycles
    func animateCell() {
        if isHighlighted {
            UIView.animate(withDuration: 0.25) {
                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.transform = .identity
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            animateCell()
        }
    }
}
