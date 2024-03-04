//
//  UIView.swift
//  RandomCollections
//
//  Created by Хасан Давронбеков on 04/03/24.
//

import UIKit

extension UIView: ReusableView { }

extension UIView {
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

extension UIView {
    class func fromNib() -> Self {
        return fromNib(nibName: nil)
    }
    
    class func fromNib(nibName: String?) -> Self {
        func fromNibHelper<T>(nibName: String?) -> T where T: UIView {
            let bundle = Bundle(for: T.self)
            let name = nibName ?? String(describing: T.self)
            return bundle.loadNibNamed(name, owner: nil, options: nil)?.first as? T ?? T()
        }
        return fromNibHelper(nibName: nibName)
    }
}
